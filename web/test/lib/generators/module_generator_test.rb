require 'test_helper'
require 'generators/module/module_generator'
require 'modules/module_generator'

class ModuleGeneratorTest < Rails::Generators::TestCase
  tests ModuleGenerator
  destination Rails.root.join("tmp/generators")
  setup :prepare_destination

  test "generator runs without errors" do
    assert_nothing_raised do
      run_generator ["arguments"]
    end
  end

  test "generator invokes Modules::ModuleGenerator" do
    mock = Minitest::Mock.new
    mock.expect :create_module_structure, nil

    Modules::ModuleGenerator.stub :new, mock do
      run_generator %w(TestModule)
    end
    assert_mock mock
  end

  test "generator rescues and reports errors in red" do
    mock = Minitest::Mock.new
    mock.expect :create_module_structure, nil do
      raise "Test Error"
    end

    generator_instance = ModuleGenerator.new(["TestModule"]) # .new accepts an array that would be passed to the generator
    generator_instance.stub :say_status, -> (status, message, color) {
      assert_equal "error", status
      assert_equal "Test Error", message
      assert_equal :red, color
    } do
      Modules::ModuleGenerator.stub :new, mock do
        generator_instance.create_module_structure
      end
    end
  end
end