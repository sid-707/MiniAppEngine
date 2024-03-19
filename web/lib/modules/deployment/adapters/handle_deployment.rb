module Modules
  module Deployment
    module Adapters
      class HandleDeployment
        include Modules::Deployment::Ports::HandleDeployment

        def initialize(deployment_repository)
          @deployment_repository = deployment_repository
        end

        def deploy(deployment_data)
          interactor = Modules::Deployment::Interactors::HandleDeployment.new(@deployment_repository)
          interactor.execute(deployment_data)
        end
      end
    end
  end
end
