pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with console_h;
with Interfaces.C.Extensions;
with list_h;
with System;
with error_h;

package console_rexpaint_h is

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

  --*
  --    \brief Return a new console loaded from a REXPaint ``.xp`` file.
  --    \param [in] filename A path to the REXPaint file.
  --    \return A new TCOD_console_t object.  New consoles will need
  --    to be deleted with a call to :any:`TCOD_console_delete`.
  --    Returns NULL on an error.
  --  

   function TCOD_console_from_xp (filename : Interfaces.C.Strings.chars_ptr) return console_h.TCOD_console_t  -- console_rexpaint.h:56
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_from_xp";

  --*
  --    \brief Update a console from a REXPaint ``.xp`` file.
  --    \param [out] con A console instance to update from the REXPaint file.
  --    \param [in] filename A path to the REXPaint file.
  --    In C++, you can pass the filepath directly to the :any:`TCODConsole`
  --    constructor to load a REXPaint file.
  --  

   function TCOD_console_load_xp (con : access console_h.TCOD_Console; filename : Interfaces.C.Strings.chars_ptr) return Extensions.bool  -- console_rexpaint.h:66
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_load_xp";

  --*
  --    \brief Save a console as a REXPaint ``.xp`` file.
  --    \param [in] con The console instance to save.
  --    \param [in] filename The filepath to save to.
  --    \param [in] compress_level A zlib compression level, from 0 to 9.
  --    1=fast, 6=balanced, 9=slowest, 0=uncompressed.
  --    \return ``true`` when the file is saved successfully, or ``false`` when an
  --    issue is detected.
  --    The REXPaint format can support a 1:1 copy of a libtcod console.
  --  

   function TCOD_console_save_xp
     (con : access constant console_h.TCOD_Console;
      filename : Interfaces.C.Strings.chars_ptr;
      compress_level : int) return Extensions.bool  -- console_rexpaint.h:79
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_save_xp";

  --*
  --    \brief Return a list of consoles from a REXPaint file.
  --    \param [in] filename A path to the REXPaint file.
  --    \return Returns a TCOD_list_t of TCOD_console_t objects.  Or NULL on an
  --    error.  You will need to delete this list and each console individually.
  --    This function can load a REXPaint file with variable layer shapes,
  --    which would cause issues for a function like TCOD_console_list_from_xp.
  --  

   function TCOD_console_list_from_xp (filename : Interfaces.C.Strings.chars_ptr) return list_h.TCOD_list_t  -- console_rexpaint.h:90
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_list_from_xp";

  --*
  --    \brief Save a list of consoles to a REXPaint file.
  --    \param [in] console_list A TCOD_list_t of TCOD_console_t objects.
  --    \param [in] filename Path to save to.
  --    \param [in] compress_level zlib compression level.
  --    \return true on success, false on a failure such as not being able to write
  --    to the path provided.
  --    This function can save any number of layers with multiple
  --    different sizes.
  --    The REXPaint tool only supports files with up to 9 layers where
  --    all layers are the same size.
  --  

   function TCOD_console_list_save_xp
     (console_list : list_h.TCOD_list_t;
      filename : Interfaces.C.Strings.chars_ptr;
      compress_level : int) return Extensions.bool  -- console_rexpaint.h:106
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_list_save_xp";

  --*
  --    @brief Load an array of consoles from a REXPaint file in memory.
  --    You can call this function with `n_out=0` and `out=NULL` to get the number of consoles in the file.
  --    @param n_data The length of the input `data` buffer.
  --    @param data The buffer where the REXPaint file is held.
  --    @param n_out The length of the output console `out` array.  Can be zero.
  --    @param out The array to fill with loaded consoles.
  --    @return Returns the number of consoles held by the file.  Returns a negative error code on error.
  --    \rst
  --    .. versionadded:: 1.18
  --    \endrst
  --  

   function TCOD_load_xp_from_memory
     (n_data : int;
      data : access unsigned_char;
      n_out : int;
      c_out : System.Address) return int  -- console_rexpaint.h:122
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_load_xp_from_memory";

  --*
  --    @brief Save an array of consoles to a REXPaint file in memory.
  --    Partially initialized consoles are released on failures.
  --    @param n_consoles The length of the input `consoles` array.
  --    @param consoles An array of tcod consoles, can not be NULL.
  --    @param n_out The size of the `out` buffer, if this is zero then upper bound to be returned.
  --    @param out A pointer to an output buffer, can be NULL.
  --    @param compression_level A compression level for the zlib library.
  --    @return If `out=NULL` then returns the upper bound of the buffer size needed.
  --            Otherwise this returns the number of bytes actually filled.
  --            On an error a negative error code is returned.
  --    \rst
  --    .. versionadded:: 1.18
  --    \endrst
  --  

   function TCOD_save_xp_to_memory
     (n_consoles : int;
      consoles : System.Address;
      n_out : int;
      c_out : access unsigned_char;
      compression_level : int) return int  -- console_rexpaint.h:141
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_save_xp_to_memory";

  --*
  --    @brief Load an array of consoles from a REXPaint file.
  --    @param path The path to the REXPaint file, can not be NULL.
  --    @param n The size of the `out` array.  Can be zero.
  --    @param out The array to fill with loaded consoles.
  --    @return Returns the number of consoles held by the file.  Returns a negative error code on error.
  --    \rst
  --    .. versionadded:: 1.18
  --    \endrst
  --  

   function TCOD_load_xp
     (path : Interfaces.C.Strings.chars_ptr;
      n : int;
      c_out : System.Address) return int  -- console_rexpaint.h:155
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_load_xp";

  --*
  --    @brief Save an array of consoles to a REXPaint file.
  --    Partially initialized consoles are released on failures.
  --    @param n The number of consoles in the `consoles` array.
  --    @param consoles An array of consoles.
  --    @param path The path write the REXPaint file, can not be NULL.
  --    @param compress_level A compression level for the zlib library.
  --    @return Returns an error code on failure.
  --    \rst
  --    .. versionadded:: 1.18
  --    \endrst
  --  

   function TCOD_save_xp
     (n : int;
      consoles : System.Address;
      path : Interfaces.C.Strings.chars_ptr;
      compress_level : int) return error_h.TCOD_Error  -- console_rexpaint.h:171
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_save_xp";

  -- extern "C"
  --*
  --    @brief Load an array of consoles from a REXPaint file.
  --    @param path The path to the REXPaint file to load.
  --    @return Returns a vector of consoles.
  --    \rst
  --    .. versionadded:: 1.18
  --    \endrst
  --  

  --*
  --    @brief Save an array of consoles to a REXPaint file.
  --    @param consoles A vector of consoles to save.
  --    @param path The path to write the REXPaint file to.
  --    @param compress_level A compression level for the zlib library.
  --    \rst
  --    .. versionadded:: 1.18
  --    \endrst
  --  

  -- namespace tcod
end console_rexpaint_h;
