require_relative '../ports/cloud_storage'

module Modules
  module Deployment
    module Interactors
      class StoreSourceCode
        def initialize(storage_repository)
          @storage_repository = storage_repository
        end

        def execute(file, metadata)
          @storage_repository.store_file(file, metadata)
        end
      end
    end
  end
end
