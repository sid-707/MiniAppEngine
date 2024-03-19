require_relative '../../module_test_helper'
require_relative 'file_storage'

class FileStorageTest < Minitest::Test
  def setup
    @cloud_storage_mock = mock('cloud_storage')
    @adapter = Modules::Deployment::Adapters::FileStorage.new(@cloud_storage_mock)
    @file = mock('file')
    @metadata = { key: 'value' }
  end

  def test_store_file_calls_cloud_storage_repository
    @cloud_storage_mock.expects(:store_file).with(@file, @metadata)

    assert_silent { @adapter.store_file(@file, @metadata) }
  end
end
