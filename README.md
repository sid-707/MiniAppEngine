# MiniAppEngine: A simple Google App Engine clone.

This is a learning exercise to understand fundamentals of OS, networking, containerization, orchestration, and modularity.

Features:
1) Deploy through a CLI
2) Manage apps with a web UI
3) Automatic scaling to 2 instances

Limitations:
    - It only supports running Python applications
    - It does not support versioning and multiple instances of an app.

There are 3 components:
- CLI app written in Typescript
- Web API and UI written in Ruby on Rails
- Control Plane written in Elixir

Later the control plane will be replaced with Kubernetes. The reason I am building this in Elixir first is to
1) learn how orchestration works. 
2) take advantage of Elixir's strengths and see how it is to build a project with it.

Aim to follow Hexagonal and EBI patterns to make the business logic framework-agnostic and then language-agnostic.
Hexagonal and EBI architectures will make the first goal seamless. In order to achieve the second, the modules can be iteratively converted to Rust to compile to WASM so that they are language agnostic. We can achieve this isolation by putting the business logic domains in modules.

The control plane can unzip the .tar.gz file and check if the user has sent Python files or not.