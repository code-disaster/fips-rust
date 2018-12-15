cmake_minimum_required(VERSION 3.5)

get_filename_component(FIPS_ROOT_DIR "../fips" ABSOLUTE)
include("${FIPS_ROOT_DIR}/cmake/fips.cmake")

fips_setup(PROJECT fips-rust-example)

fips_begin_app(hello cmdline)

fips_files(src/hello.c)

fips_deps(hello_lib)

if (FIPS_WINDOWS)
  fips_libs(userenv)
endif()

if (FIPS_LINUX)
  fips_libs(dl)
endif()

if (FIPS_OSX)
  fips_libs(resolv)
endif()

fips_end_app()

fips_finish()
