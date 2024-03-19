require 'test_helper'
require_relative 'cloud_storage'

class CloudStorageTest < Minitest::Test
  def setup
    @cloud_storage = Infrastructure::Storage::CloudStorage.new
    @file = mock('file')
    @metadata = { key: 'value' }
  end

  def test_store_file_calls_cloud_storage_service
    # Mocking the external cloud storage service
    cloud_service_mock = mock('cloud_service')
    cloud_service_mock.expects(:upload).with(@file, @metadata)

    @cloud_storage.stub :cloud_service, cloud_service_mock do
      @cloud_storage.store_file(@file, @metadata)
    end
  end
end
