# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

I aim to implement the Hexagonal and EBI patterns.

Tools to add:
Sorbet and RBS: Type checking
Ruby LSP and Solargraph: Intellisense
Packwerk: Enforce boundaries in modules
Rubocop: Prevent modules from using Rails specific features.

Lessons Learned and Design Decisions:
You can generate generators with `Rails generate generator <name_of_generator>`

`bin/rails test` runs `MiniTest`. `MiniTest` doesn't have good support for mocking and stubbing. You can add `mocha/minitest` for that [[source](https://semaphoreci.com/community/tutorials/mocking-in-ruby-with-minitest)]
Thus, `rspec-rails` was added to the project since it has better support for mocking and stubbing.
However, RSpec does not support testing file system operations so regular Ruby methods were used for this purpose (eg. `spec/generator/module_generator_spec.rb`).


I've added a Rails generator called `ModuleGenerator` to generate all the files for a module. However, I've extracted the business logic in and put it in `Modules::ModuleGenerator` in order to make it independent which is a goal of this project. This module generator should be able to run in any Ruby environment.

RSpec does not recognize `Rails::Generators`. Looks like it does not support testing generators. Therefore, MiniTest is used to test the generators.

It was difficult to test for `say_status` in the tests with Minitest so that method was stubbed.



