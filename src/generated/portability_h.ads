pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with sys_utypes_usize_t_h;

package portability_h is

  -- BSD 3-Clause License
  -- *
  -- * Copyright © 2008-2021, Jice and the libtcod contributors.
  -- * All rights reserved.
  -- *
  -- * Redistribution and use in source and binary forms, with or without
  -- * modification, are permitted provided that the following conditions are met:
  -- *
  -- * 1. Redistributions of source code must retain the above copyright notice,
  -- *    this list of conditions and the following disclaimer.
  -- *
  -- * 2. Redistributions in binary form must reproduce the above copyright notice,
  -- *    this list of conditions and the following disclaimer in the documentation
  -- *    and/or other materials provided with the distribution.
  -- *
  -- * 3. Neither the name of the copyright holder nor the names of its
  -- *    contributors may be used to endorse or promote products derived from
  -- *    this software without specific prior written permission.
  -- *
  -- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  -- * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  -- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
  -- * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
  -- * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
  -- * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
  -- * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
  -- * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
  -- * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
  -- * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
  -- * POSSIBILITY OF SUCH DAMAGE.
  --  

  -- uncomment to disable unicode support  
  --#define NO_UNICODE  
  -- uncomment to disable opengl support  
  --#define NO_OPENGL  
  -- os identification
  --   TCOD_WINDOWS : OS is windows
  --   TCOD_LINUX : OS is Linux
  --   TCOD_MACOSX : OS is Mac OS X
  --   TCOD_HAIKU : OS is Haiku  

  -- compiler identification
  --   TCOD_VISUAL_STUDIO : compiler is Microsoft Visual Studio
  --   TCOD_MINGW32 : compiler is Mingw32
  --   TCOD_GCC : compiler is gcc/g++  

  -- word size
  --   TCOD_64BITS : 64 bits OS
  --   TCOD_WIN64 : 64 bits Windows
  --   TCOD_WIN32 : 32 bits Windows
  --   TCOD_LINUX64 : 64 bits Linux
  --   TCOD_LINUX32 : 32 bits Linux
  --   TCOD_FREEBSD64 : 64 bits FreeBSD
  --   TCOD_FREEBSD32 : 32 bits FreeBSD  

  -- unicode rendering functions support  
  -- int types  
  -- bool type  
  -- ansi C lacks support for those functions  
  --*
  --    Allocate and return a duplicate of string `s`.  The returned memory must be freed manually.
  --  

   function TCOD_strdup (arg1 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- portability.h:126
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_strdup";

   function TCOD_strcasecmp (s1 : Interfaces.C.Strings.chars_ptr; s2 : Interfaces.C.Strings.chars_ptr) return int  -- portability.h:127
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_strcasecmp";

   function TCOD_strncasecmp
     (s1 : Interfaces.C.Strings.chars_ptr;
      s2 : Interfaces.C.Strings.chars_ptr;
      n : sys_utypes_usize_t_h.size_t) return int  -- portability.h:128
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_strncasecmp";

  -- Define vswprintf across platforms.  
end portability_h;
