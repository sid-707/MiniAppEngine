Limitations:
    - It only supports running Python applications
    - It does not support versioning and multiple instances of an app.

Aim to follow Hexagonal and EBI patterns to make the business logic first, framework agnostic, and then, language agnostic.
Hexagonal and EBI architectures will make the first goal seamless. In order to achieve the second, the modules can be iteratively converted first Rust then WASM so that they are language agnostic. We can acieve this isolation by putting the business logic domains in gems.