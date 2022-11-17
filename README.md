# Libtcod-Ada

This is an Ada binding for [libtcod 1.18.1](https://github.com/libtcod/libtcod). Libtcod
is a library used in many rougelike games. It includes lots of useful functionality,
such as field of view calculation, pathfinding, and graphics.

This is a thick binding to the library, meaning that the API is Ada-like and not a minimal
wrapper around the C functions (for example, most uses of pointers are hidden on the Ada side).
However, there is mostly a one-to-one correspondence between the C functions and the
Ada functions/procedures.

Ada features such as strong typing, controlled types, and exceptions are used to reduce
chances for error and to make the library more familiar to use. No explicit memory
allocation/freeing is necessary; controlled types will handle cleanup automatically.

A couple of demo programs are included within the `demo` directory.

## Current Features

- Console functions (drawing to the screen, setting tiles/colors, etc.)
- Input functions (reading from keyboard, handling input events)
- Field of view
- Pathfinding
- Binary space partitioning (used for dungeon generation algorithms)
- Line drawing
- Clipboard

All features should work on any supported platform.

## Building

### Dependencies

Building this library requires a few dependencies to be installed on your system:

- The [Alire](https://alire.ada.dev) package manager/build tool
- a GNAT compiler toolchain that supports Ada 2012. This should be easily
installable from Alire.
- SDL2
- zlib (practically every Unix-like OS should already have this installed)

Note that the libtcod library itself **does not** have to be installed. A copy of the libtcod
source code is embedded in this repository. The build system that handles building
the bindings will handle building a copy libtcod as well and do all of the
work of linking it into a single static library.

If you have a version of Libtcod installed on your system, these bindings will
not use it or interfere with it.

Make sure that the SDL2 and zlib's header and library files are reachable
from your PATH so that they are accessible to the Ada compiler.

### Build command

To build, enter the root directory of the repository and run:

```
alr build
```

After building, a static library will be found in the `lib/libtcod_ada` 
directory, while the example programs `keys` and `tutorial`
will located in the `obj` directory. You can then run them from the root
directory of this repository like so:

```
obj/keys
```

and

```
obj/tutorial
```

## License

This binding is licensed under the BSD-3 License, the same license used by libtcod. Please
see the libtcod documentation (located in the `third_party/libtcod` directory) for more information
about libtcod's licensing/contributors.

This binding is not an official binding of the libtcod project or written by the authors
of libtcod.
