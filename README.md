# fips-rust

A [fips](https://github.com/floooh/fips) module to compile Rust/Cargo libraries, using [CMake Rust Language Support](https://github.com/Devolutions/CMakeRust).

## Usage

Just add `fips-rust` as a dependency to your project or library.

~~~
# fips.yml

---
imports:
  fips-rust:
    git: https://github.com/code-disaster/fips-rust.git
~~~

To build a Rust library, use the `fips_rust_cargo_lib()` macro instead of the usual `fips_begin_lib()/fips_end_lib()` pair.

~~~
# CMakeLists.txt

fips_rust_cargo_lib(library-name)
~~~

You'll probably need to link some additional system libraries required by the Rust runtime.

~~~
# CMakeLists.txt

if (FIPS_WINDOWS)
  fips_libs(userenv) # ws2_32 already linked by default
endif()

if (FIPS_LINUX)
  fips_libs(dl) # pthread already linked by default
endif()

if (FIPS_OSX)
  fips_libs(resolv)
endif()
~~~

Lastly, don't forget to configure your Cargo project to build a static library.

~~~
# Cargo.toml

[lib]
crate-type = ["staticlib"]
~~~
