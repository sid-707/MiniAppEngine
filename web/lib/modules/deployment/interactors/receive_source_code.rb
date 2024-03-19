module Modules
  module Deployment
    module Interactors
      class ReceiveSourceCode
        MAX_FILE_SIZE = 100 * 1024 * 1024 # 100 MB in bytes
        VALID_FILE_EXTENSION = '.tar.gz'.freeze

        class InvalidFileTypeError < StandardError; end
        class FileSizeExceededError < StandardError; end

        # Reverses the contents of a String or IO object.
        #
        # @param file [File] the file to upload
        def execute(file)
          validate!(file)
        end

        private

        # Validates the file type and size
        #
        # @param file [File] the file to validate
        def validate!(file)
          validate_file_type!(file)
          validate_file_size!(file)
        end

        def validate_file_type!(file)
          raise InvalidFileTypeError unless file.original_filename.end_with?(VALID_FILE_EXTENSION)
        end

        def validate_file_size!(file)
          raise FileSizeExceededError if file.size > MAX_FILE_SIZE
        end
      end
    end
  end
end
