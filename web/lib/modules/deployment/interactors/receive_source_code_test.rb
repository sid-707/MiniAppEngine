require_relative '../../module_test_helper'
require_relative 'review_source_code'

class ReceiveSourceCodeTest < Minitest::Test
  MAX_FILE_SIZE = 100 * 1024 * 1024 # 100 MB in bytes

  def setup
    @interactor = Modules::Deployment::Interactors::UploadFile.new
  end

  def test_valid_file_does_not_raise_exception
    @valid_file = mock('file', original_filename: 'app.tar.gz', size: MAX_FILE_SIZE - 1)
    assert_silent { @interactor.execute(@valid_file) }
  end

  def test_large_file_raises_file_size_exceeded_error
    @large_file = mock('file', original_filename: 'app.tar.gz', size: MAX_FILE_SIZE + 1)
    assert_raises(Modules::Deployment::Interactors::UploadFile::FileSizeExceededError) do
      @interactor.execute(@large_file)
    end
  end

  def test_invalid_file_type_raises_invalid_file_type_error
    @invalid_file_type = mock('file', original_filename: 'app.zip')
    assert_raises(Modules::Deployment::Interactors::UploadFile::InvalidFileTypeError) do
      @interactor.execute(@invalid_file_type)
    end
  end
end
