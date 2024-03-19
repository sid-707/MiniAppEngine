module Modules
  module Deployment
    module Interactors
      class HandleDeployment
        class InvalidParamsError < StandardError; end

        def initialize(repository, cloud_storage, background_jobs_queue)
          @repository = repository
          @cloud_storage = cloud_storage
          @background_jobs_queue = background_jobs_queue
        end

        def execute(handle_deployment_dto)
          contract = Modules::Deployment::Entities::DeploymentContract.new
          result = contract.call(handle_deployment_dto)

          raise InvalidParamsError unless result.success? # access result.errors.to_h for errors

          deployment = Modules::Deployment::Entities::Deployment.new(result.to_h)

          ReceiveSourceCode.execute(deployment.file)

          # Store in data repo 
          # Store the code in a bucket
          # StoreSourceCode

          # create a background job.
          # EnqueueDeploymentJob
        end
      end
    end
  end
end
