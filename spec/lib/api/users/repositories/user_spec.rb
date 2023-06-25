# frozen_string_literal: true

require 'db_spec_helper'
require 'api/users/repositories/user'

RSpec.describe Api::Users::Repositories::User, type: :db do
  subject(:repository) { described_class.new }

  describe '#create' do
    subject(:create) { repository.create(attributes) }

    let(:attributes) { build(:user).to_h }

    its(:value!) { is_expected.to be_an_instance_of(Api::Users::Entities::User) }

    it 'creates a new user' do
      expect { create }.to change { repository.root.count }.by 1
    end
  end

  describe '#update' do
    subject(:update) { ->(id, fields) { repository.update(id, fields) } }

    let(:user) { Factory[:user, last_name: 'Gigi'] }

    it 'will update the last name' do
      update.call(user.id, last_name: 'Ion')

      expect(repository.find_by_id(user.id).value!.last_name).to eq 'Ion'
    end

    it 'returns a instance of Entities::User' do
      expect(update.call(user.id, last_name: 'Ion').value!).to be_an_instance_of(Api::Users::Entities::User)
    end
  end

  describe '#delete' do
    subject(:delete) { repository.delete(user_id) }

    context 'with existing user' do
      let(:user_id) { user.id }
      let(:user) { Factory[:user] }

      before { user }

      it 'will remove the user' do
        expect { delete }.to change { repository.root.count }.by(-1)
      end
    end

    context 'with non-existing user' do
      let(:user_id) { 42 }

      it { is_expected.to be_failure }
      its(:failure) { is_expected.to eq :not_found }
    end
  end

  describe '#find_by_id' do
    subject(:find_by_id) { repository.find_by_id(id) }

    context 'with non-existing user' do
      let(:id) { 24 }

      it { is_expected.to be_none }
    end

    context 'with existing user' do
      let(:id) { user.id }
      let(:user) { Factory[:user] }

      it { is_expected.to be_some }
      its(:value!) { is_expected.to be_an_instance_of(Api::Users::Entities::User) }
      its(:'value!.id') { is_expected.to eq id }
    end
  end

  describe '#filter' do
    subject(:filter) { repository.filter(params).value! }

    context 'without filters' do
      let(:params) { {} }

      context 'with records' do
        before { 2.times { Factory[:user] } }

        its(:count) { is_expected.to eq 2 }
        it { is_expected.to all be_an_instance_of Api::Users::Entities::User }
      end
    end

    context 'with filters' do
      let(:params) { { filter: { last_name: 'Ion' } } }

      context 'with records' do
        before do
          2.times { Factory[:user] }
          Factory[:user, last_name: 'Ion']
        end

        its(:count) { is_expected.to eq 1 }
        it { is_expected.to all be_an_instance_of Api::Users::Entities::User }
      end
    end
  end
end
