# README

This is where users and apps will be managed through a Web API and UI.

## Architecture
I aim to implement the Hexagonal and EBI patterns to make this as modular as possible. At first, the goal is to make the business logic as framework-agnostic as possible so that theoretically the modules can be migrated as gems to another Ruby framework like Hanami or Sinatra without much difficulty.
The second goal is to iteratively convert these gems from Ruby to Rust using [bundler's support](https://bundler.io/blog/2023/01/31/rust-gem-skeleton.html) for including Rust code in gems. This would allow these gems to be compiled to WASM which should make the business logic language-agnostic. Then, theoretically, they can be migrated to any other framework such as Django or NestJS.

From hexagonal architecture:
 - Each module has ports which are abstract interfaces and DTOs used for data transfers to ports.
 - Each module has adapters that implement ports. One port can have different adapters depending on the interfaces. Adapters can have their DTOs for inputs and outputs that can be extended from the Port DTOs
  
From EBI:
  - I've skipped Boundaries since like ports these are also abstract interfaces so they are redundant.
  - Each module has Interactors that implement the use cases/ application specific business rules, i.e., business logic.
  - Each module has Entities that represent the domain objects that are application independent business rules

There is an infrastructure layer that contains the framework level details. This way the modules can be pure Ruby code and are independent from Rails.

Ports are interfaces that are implemented inside a module as adapters and outside modules in the infrastructure layer. A service layer is used to initialize components from the infrastructure layer and pass them to adapters inside modules. Adapters then execute their associated interactors.

## Lessons Learned and Design Decisions
You can generate generators with `Rails generate generator <name_of_generator>`

`bin/rails test` runs `MiniTest`. `MiniTest` doesn't have good support for mocking and stubbing. I added `mocha` for that [[source](https://semaphoreci.com/community/tutorials/mocking-in-ruby-with-minitest)]

I've added a Rails generator called `ModuleGenerator` to generate all the files for a module. However, I've extracted the business logic in and put it in `Modules::ModuleGenerator` in order to make it independent which is a goal of this project. This module generator should be able to run in any Ruby environment.

It was difficult to test for `say_status` in the tests with Minitest so that method was stubbed.

In order to use `Minitest::Mock` in tests, you have to add `require "minitest/autorun"` to the `test_helper.rb` file.

To run Ruby tests inside the `lib/modules` folder, use `ruby -Itest <path to file>`

The Deployment module expects a `.tar.gz`. The compressed source code should have a limit of 100MB.

