pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with mersenne_types_h;
with Interfaces.C.Extensions;
with list_h;

package namegen_h is

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

  -- * Mingos' NameGen
  -- * This file was written by Dominik "Mingos" Marczuk.
  --  

  -- the generator typedef  
   type TCOD_NameGen is null record;   -- incomplete struct

   type TCOD_namegen_t is access all TCOD_NameGen;  -- namegen.h:49

  -- parse a file with syllable sets  
   procedure TCOD_namegen_parse (filename : Interfaces.C.Strings.chars_ptr; random : mersenne_types_h.TCOD_random_t)  -- namegen.h:52
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_namegen_parse";

  -- generate a name  
   function TCOD_namegen_generate (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Extensions.bool) return Interfaces.C.Strings.chars_ptr  -- namegen.h:54
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_namegen_generate";

  -- generate a name using a custom generation rule  
   function TCOD_namegen_generate_custom
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : Extensions.bool) return Interfaces.C.Strings.chars_ptr  -- namegen.h:56
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_namegen_generate_custom";

  -- retrieve the list of all available syllable set names  
   function TCOD_namegen_get_sets return list_h.TCOD_list_t  -- namegen.h:58
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_namegen_get_sets";

  -- delete a generator  
   procedure TCOD_namegen_destroy  -- namegen.h:60
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_namegen_destroy";

end namegen_h;
