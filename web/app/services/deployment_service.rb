require 'lib/infrastructure/repositories/active_record_repository'
require 'lib/modules/deployment/repositories/deployment_data_repository'

class DeploymentService
  def initialize(deployment_params)
    # Use a DTO instead of deployment_params
    @deployment_params = deployment_params

    # Make an ActiveRecordRepositories module and add deployment to it.
    # Set that as the deployment repository. Then you don't need the deployment data repo.
    active_record_repository = Infrastructure::Repositories::ActiveRecordRepository.new
    @deployment_repository = Modules::Deployment::Repositories::DeploymentDataRepository.new(active_record_repository)
    @minio_storage = Infrastructure::MinIoStorage.new
    @kafka_queue = Infrastructure::KafkaQueue.new
  end

  def call
    deployment_adapter = Modules::Deployment::Adapters::HandleDeployment.new(repository: @deployment_repository,
                                                                             cloud_storage: @minio_storage, background_jobs_queue: @kafka_queue)
    deployment_adapter.deploy(@deployment_params)
  end
end
