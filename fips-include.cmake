get_filename_component(FIPS_RUST_DIR "../fips-rust" ABSOLUTE)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${FIPS_RUST_DIR}/cmake")

enable_language(Rust)
include(CMakeCargo)

#-------------------------------------------------------------------------------
#   fips_rust_cargo_lib(name)
#   Define a static Rust/Cargo library.
#   (This is a condensed copy of fips_begin_lib/fips_end_lib.)
#
macro(fips_rust_cargo_lib name)
    set(name ${name})
    if (FIPS_CMAKE_VERBOSE)
        message("Rust library: name=" ${name})
    endif()
    fips_reset(${name})

    # add library target
    cargo_build(NAME ${CurTargetName})
    # add to "CMakeRust" IDE folder
    set_target_properties(${CurTargetName}_target PROPERTIES FOLDER "CMakeRust")

    # track some target properties in YAML files
    fips_addto_targets_list(${CurTargetName} "lib")
    fips_addto_headerdirs_list(${CurTargetName})
    fips_addto_defines_list(${CurTargetName})
endmacro()
