require 'spec_helper'
require_relative './module_generator'

RSpec.describe Modules::ModuleGenerator do
    describe '#create_module_structure' do
        let(:module_name) { 'TestModule' }
        let(:generator) { Modules::ModuleGenerator.new(module_name) }
        let(:base_path) { "app/modules/test_module" }
  
        context 'when the module does not exist' do
            before do
                allow(Dir).to receive(:exist?).and_return(false)
                allow(Dir).to receive(:mkdir)
                generator.create_module_structure
            end

            it 'creates the module subdirectories' do
                subdirectories = %w[entities interactors boundaries repositories]
                subdirectories.each do |subdir|
                    expect(Dir).to have_received(:mkdir).with("#{base_path}/#{subdir}")
                end
            end
        end

        context 'when the module already exists' do
            it 'does not create any directories' do
                allow(Dir).to receive(:exist?).and_return(true)
                expect(Dir).not_to receive(:mkdir)
                expect { generator.create_module_structure }.to raise_error(RuntimeError)
            end
        end
    end
end