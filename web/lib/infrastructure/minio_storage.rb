require_relative '../../modules/deployment/ports/file_storage'

module Infrastructure
  class MinIoStorage
    include Modules::Deployment::Ports::CloudStorage

    def initialize(cloud_service = DefaultCloudService.new)
      @cloud_service = cloud_service
    end

    def store_file(file, metadata)
      @cloud_service.upload(file, metadata)
    end
  end
end
