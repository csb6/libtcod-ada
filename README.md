# Libtcod-Ada

This is an Ada binding for [libtcod 1.18.1](https://github.com/libtcod/libtcod). Libtcod
is a library used in many rougelike games. It includes lots of useful functionality,
such as field of view calculation, pathfinding, graphics, and more.

This is a thick binding to the library, meaning that the API is Ada-like and not a minimal
wrapper around the C functions (for example, most use of pointers are hidden on the Ada side).

Ada features such as strong typing, controlled types, and exceptions are used to reduce
chances for error and to make the library more familiar to use. No explicit memory
allocation/freeing is necessary; controlled types will handle cleanup automatically.

## Current Features

- Console functions (drawing to the screen, setting tiles/colors, etc.)
- Input functions (reading from keyboard, handling input events)
- Field of view
- Pathfinding
- Clipboard (works cross-platform)

## Building

### Dependencies

Building this library requires a few dependencies to be installed on your system:

- a GNAT compiler that supports Ada 2012. The compiler that comes with the GNAT
Community Edition from AdaCore will work fine, as will a build of GCC that includes the Ada
frontend, such as the one from getadanow.com.
- gprbuild, a build tool. This should be installed as part of your Ada compiler's toolchain,
so in most cases you will already have it once you install GNAT
- SDL2
- zlib (practically every Unix-like OS should already have this installed)

Note that the libtcod library itself does not have to be installed. A copy of the libtcod
source code is embedded in this repository. The build system that handles building
the bindings will handle building this version of libtcod as well and do all of the
work of linking it into a static library for you to use.

Make sure that the SDL2 and zlib's header and library files are reachable from your PATH
so that they are accessible to the Ada compiler.

## Building

Each OS uses gprbuild, but a flag indicating the current OS needs to be passed.

After following the directions below,  static library will be found in the `lib/libtcod_ada`
directory, while the example program `main` will located in the object directory.

### Windows

In the root directory of this repository, run the following command:

```
gprbuild -Plibtcod_ada.gpr -XPlatform="windows"
```

### macOS

In the root directory of this repository, run the following command:

```
gprbuild -Plibtcod_ada.gpr -XPlatform="macos"
```

### Linux

### Windows

In the root directory of this repository, run the following command:

```
gprbuild -Plibtcod_ada.gpr -XPlatform="linux"
```

## License

This binding is licensed under the BSD-3 License, the same license used by libtcod. Please
see the libtcod documentation (located in the `libtcod` directory) for more information
about libtcod's licensing/contributors.

This binding is not an official binding of the libtcod project.
