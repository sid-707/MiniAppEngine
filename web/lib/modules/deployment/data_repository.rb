# frozen_string_literal: true

module Modules
  module Deployment
    module Repositories
      class DataRepository
        def initialize(deployment_repo)
          @deployment_repo = deployment_repo
        end

        # Delegate methods to @deployment_repo...
      end
    end
  end
end
