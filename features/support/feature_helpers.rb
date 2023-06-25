# frozen_string_literal: true

module FeatureHelpers
  module_function

  def get_request(route, args = {})
    header 'Authorization', @last_session_token
    get route, args
  end

  def post_request(route, json_request_file = nil, json_args = {})
    header 'Authorization', @last_session_token
    payload = json_request_file.present? ? route_helpers.format_json_file(json_request_file, json_args) : {}
    post route, payload
  end

  def patch_request(route, json_request_file, json_args = {})
    header 'Authorization', @last_session_token
    payload = route_helpers.format_json_file(json_request_file, json_args)
    patch route, payload
  end

  def delete_request(route, payload = nil)
    header 'Authorization', @last_session_token
    delete route, payload
  end

  def validate_response(json_response_file, json_args = {})
    response = route_helpers.format_json_file(json_response_file, json_args).to_json

    expect(last_response.body).to match_json_structure(response)
  end
end
