# frozen_string_literal: true

require 'spec_helper'
require 'dry/effects'
require 'rack/utils'
require 'rack/response'

require 'api/users/controller'

RSpec.describe Api::Users::Controller do
  include Dry::Effects::Handler.State(:response)
  include Dry::Effects::Handler.State(:request_params)

  describe '#index' do
    subject(:index) do
      with_response(Rack::Response.new) { with_request_params(nil) { controller(filter_transaction: filter_transaction).index({}) } }
    end

    let(:filter_transaction) { StubbedOperation.success([build(:user)]) }

    it 'responds with 200' do
      response, = index
      expect(response.status).to be :ok
    end
  end

  describe '#create' do
    subject(:create) do
      with_response(Rack::Response.new) { with_request_params(nil) { controller(create_transaction: create_transaction).create({}) } }
    end

    let(:create_transaction) { StubbedOperation.success(build(:user)) }

    it 'will return 201 created' do
      response, = create
      expect(response.status).to be :created
    end
  end

  describe '#update' do
    subject(:update) do
      with_response(Rack::Response.new) { with_request_params(nil) { controller(update_transaction: update_transaction).update(42, {}) } }
    end

    let(:update_transaction) { StubbedOperation.success(build(:user)) }

    it 'responds with 200 ok' do
      response, = update
      expect(response.status).to be :ok
    end
  end

  describe '#delete' do
    subject(:delete) do
      with_response(Rack::Response.new) { with_request_params(nil) { controller.delete(42) } }
    end

    it 'will return 204 no content' do
      response, = delete
      expect(response.status).to be :no_content
    end
  end

  describe '#show' do
    subject(:show) do
      with_response(Rack::Response.new) { with_request_params(nil) { controller(get_operation: get_operation).show(42) } }
    end

    let(:get_operation) { StubbedOperation.success(build(:user)) }

    it 'responds with 200' do
      response, = show
      expect(response.status).to be :ok
    end
  end

  def controller(get_operation: StubbedOperation.success,
                 filter_transaction: StubbedOperation.success([build(:user)]),
                 create_transaction: StubbedOperation.success,
                 update_transaction: StubbedOperation.success)
    described_class.new(
      get_operation: get_operation,
      filter_transaction: filter_transaction,
      create_transaction: create_transaction,
      update_transaction: update_transaction,
      delete_transaction: StubbedOperation.success
    )
  end
end
