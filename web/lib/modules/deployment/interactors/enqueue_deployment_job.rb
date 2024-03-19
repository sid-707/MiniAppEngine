module Modules
  module Deployment
    module Interactors
      class EnqueueDeploymentJob
        def initialize(background_job_queue)
          @background_job_queue = background_job_queue
        end

        def execute(deployment_job)
          @background_job_queue.enqueue_deployment_job(deployment_job)
        end
      end
    end
  end
end
