#!/usr/bin/env sh

set -e

# Note:
# This script does not build the library. It is used to do some of the tedious
# translation between C++ header files and Ada spec files. Will always need
# some hand-modification, so do not use this unless you are rewriting the bindings.
# If you just want to build the bindings and start using them, use the Makefile.

# The path to a GCC `gcc` executable that has support for Ada.
# Set this its location on your system
gnat_compiler="/users/coleblakley/opt/GNAT/2020/bin/gcc"
# Flags for the generation process
gnat_flags="-std=c99 -c -fdump-ada-spec"

cd third_party/libtcod/src/libtcod
$gnat_compiler $gnat_flags -I. -C libtcod.h
mv *.ads ../../../../src/generated
