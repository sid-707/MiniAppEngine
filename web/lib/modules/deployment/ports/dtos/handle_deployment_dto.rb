module Modules
  module Deployment
    module Ports
      module DTOs
        class HandleDeploymentDTO
          attr_reader :file_location, :deployment_params

          def initialize(file_location:, deployment_params:)
            @file_location = file_location
            @deployment_params = deployment_params
          end
        end
      end
    end
  end
end
