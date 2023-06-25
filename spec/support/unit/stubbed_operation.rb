# frozen_string_literal: true

require 'dry-monads'
require 'dry/monads/result'
require 'dry/matcher'
require 'dry/matcher/result_matcher'

class StubbedOperation
  include Dry::Matcher.for(:call, with: Dry::Matcher::ResultMatcher)

  def self.success(result = Dry::Monads::Undefined)
    StubbedOperation.new(Dry::Monads::Success(result))
  end

  def self.failure(errors)
    StubbedOperation.new(Dry::Monads::Failure(errors))
  end

  def call(_input = {}, _args = {})
    @fake_call
  end

  def with_step_args(_input = {})
    self
  end

  private

  def initialize(fake_call)
    @fake_call = fake_call
  end
end
