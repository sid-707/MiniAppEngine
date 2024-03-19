# frozen_string_literal: true

class ModuleGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  def create_module_structure
    core_generator = Modules::ModuleGenerator.new(file_name)
    core_generator.create_module_structure
  rescue StandardError => e
    say_status('error', e.message, :red)
  end
end
