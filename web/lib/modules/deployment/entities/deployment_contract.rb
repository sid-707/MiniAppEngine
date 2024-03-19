require 'dry-validation'

module Modules
  module Deployment
    module Entities
      class DeploymentContract < Dry::Validation::Contract
        params do
          required(:file_location).filled(:string)
          required(:status).filled(:string)
          optional(:deployed_at).filled(:date_time)
          optional(:additional_parameters).filled(:hash)
        end
      end
    end
  end
end
