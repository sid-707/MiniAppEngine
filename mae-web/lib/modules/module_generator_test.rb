require_relative 'module_test_helper.rb'
require_relative '../../lib/modules/module_generator'

class ModuleGeneratorTest < Minitest::Test
  def setup
    @module_name = 'TestModule'
    @generator = Modules::ModuleGenerator.new(@module_name)
    @base_path = "app/modules/test_module"
  end

  def test_create_module_structure_when_module_does_not_exist
    Dir.stubs(:exist?).returns(false)
    mkdir_calls = []
    Dir.define_singleton_method(:mkdir) { |path| mkdir_calls << path }

    @generator.create_module_structure

    expected_directories = [@base_path] + %w[entities interactors boundaries].map { |subdir| "#{@base_path}/#{subdir}" } + ["#{@base_path}/boundaries/repositories"]

    assert_equal expected_directories.sort, mkdir_calls.sort

    # Clean up by removing the singleton method after the test
    Dir.singleton_class.undef_method(:mkdir)
  end

  def test_create_module_structure_when_module_already_exists
    Dir.stub :exist?, true do
      assert_raises(RuntimeError) do
        @generator.create_module_structure
      end
    end
  end
end