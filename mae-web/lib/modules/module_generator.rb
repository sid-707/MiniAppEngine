module Modules
    class ModuleGenerator
        attr_reader :module_name, :base_path

        def initialize(module_name)
            @module_name = module_name
            @base_path = "app/modules/#{to_underscore(module_name)}"
        end

        def create_module_structure
            if Dir.exist?(base_path)
                raise "Module '#{module_name} already exists."
            else
                create_directory_structure(base_path)
            end
        end

        private

        def create_directory_structure(base_path)
            create_directory(base_path)
        
            ['entities', 'interactors', 'boundaries'].each do |subdir|
                create_directory(File.join(base_path, subdir))
            end

            create_directory(File.join(base_path, 'boundaries', 'repositories'))
        end

        def create_directory(path)
            Dir.mkdir(path) unless Dir.exist?(path)
        end

        def to_underscore(string)
            string.gsub(/::/, '/')
                 .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
                 .gsub(/([a-z\d])([A-Z])/, '\1_\2')
                 .tr("-", "_")
                 .downcase
          end
    end
end