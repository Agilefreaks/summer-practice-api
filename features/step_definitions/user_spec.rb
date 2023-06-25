# frozen_string_literal: true

# Actions

When 'I create a user' do
  create_user
end

When 'I remove that user' do
  delete_request(route_helpers.route_for(:delete_user, id: @last_user_id))
end

When 'I retrieve the list of users' do
  get_request(route_helpers.route_for(:users))
end

When 'I get that user' do
  get_request(route_helpers.route_for(:user, id: @last_user_id))
end

When 'I update {string} to {string} for that user' do |field, value|
  patch_request(route_helpers.route_for(:update_user, id: @last_user_id), 'users/requests/update.json', { attributes: Hash[field, value].to_json })
end

When 'I filter by {string}, all the users with value {string}' do |field, value|
  params = { filter: Hash[field, value] }
  get_request(route_helpers.route_for(:users), params)
end

Given 'a user exists' do
  create_user
end

Given 'a user exists, with {string} being {string}' do |field, value|
  create_user(Hash[field, value])
end

# Assertions

Then 'the user should be returned' do
  validate_response 'users/responses/get.json', { id: @last_user_id }
end

Then 'I will get a response containing the list of users' do
  validate_response 'users/responses/get_all.json'
end

Then 'the user {string} should be updated to {string}' do |field, value|
  validate_response 'users/responses/update.json', Hash[field, value].merge(id: @last_user_id)
end

Then 'it should respond with not found' do
  expect(last_response.status).to eq 404
end

Then 'it should respond with forbidden' do
  expect(last_response.status).to eq 403
end

Then 'it should respond with created' do
  expect(last_response.status).to eq 201
end

Then 'it should respond with ok' do
  expect(last_response.status).to eq 200
end

Then 'it should respond with no content' do
  expect(last_response.status).to eq 204
end

Then 'returns a validation error {string}' do |error_message|
  expect(parsed_body['errors']).to(be_any { |error| error['detail'].include?(error_message) })
end

module UserHelpers
  def create_user(args = {})
    post_request(route_helpers.route_for(:create_user), 'users/requests/create.json', args)
    @last_user_id = parsed_body.dig('data', 'id')
  end
end

World(UserHelpers)
