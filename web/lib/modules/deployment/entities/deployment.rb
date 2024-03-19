require 'dry-struct'

module Types
  include Dry.Types()
end

module Modules
  module Deployment
    module Entities
      class Deployment < Dry::Struct
        attribute :file_location, Types::String
        attribute :status, Types::String
        attribute :deployed_at, Types::DateTime.optional.default(nil)
        attribute :additional_parameters, Types::Hash.optional.default({})
      end
    end
  end
end
