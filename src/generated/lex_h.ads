pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with Interfaces.C.Extensions;
with System;

package lex_h is

   TCOD_LEX_FLAG_NOCASE : constant := 1;  --  lex.h:45
   TCOD_LEX_FLAG_NESTING_COMMENT : constant := 2;  --  lex.h:46
   TCOD_LEX_FLAG_TOKENIZE_COMMENTS : constant := 4;  --  lex.h:47

   TCOD_LEX_ERROR : constant := -1;  --  lex.h:49
   TCOD_LEX_UNKNOWN : constant := 0;  --  lex.h:50
   TCOD_LEX_SYMBOL : constant := 1;  --  lex.h:51
   TCOD_LEX_KEYWORD : constant := 2;  --  lex.h:52
   TCOD_LEX_IDEN : constant := 3;  --  lex.h:53
   TCOD_LEX_STRING : constant := 4;  --  lex.h:54
   TCOD_LEX_INTEGER : constant := 5;  --  lex.h:55
   TCOD_LEX_FLOAT : constant := 6;  --  lex.h:56
   TCOD_LEX_CHAR : constant := 7;  --  lex.h:57
   TCOD_LEX_EOF : constant := 8;  --  lex.h:58
   TCOD_LEX_COMMENT : constant := 9;  --  lex.h:59

   TCOD_LEX_MAX_SYMBOLS : constant := 100;  --  lex.h:61
   TCOD_LEX_SYMBOL_SIZE : constant := 5;  --  lex.h:62
   TCOD_LEX_MAX_KEYWORDS : constant := 100;  --  lex.h:63
   TCOD_LEX_KEYWORD_SIZE : constant := 20;  --  lex.h:64

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

  -- * This is a libtcod internal module.
  -- * Use at your own risks...
  --  

  -- private stuff  
  -- is this object a savepoint (no free in destructor)  
   type TCOD_lex_t_array2045 is array (0 .. 99, 0 .. 4) of aliased char;
   type TCOD_lex_t_array2048 is array (0 .. 99, 0 .. 19) of aliased char;
   type TCOD_lex_t is record
      file_line : aliased int;  -- lex.h:67
      token_type : aliased int;  -- lex.h:67
      token_int_val : aliased int;  -- lex.h:67
      token_idx : aliased int;  -- lex.h:67
      token_float_val : aliased float;  -- lex.h:68
      tok : Interfaces.C.Strings.chars_ptr;  -- lex.h:69
      toklen : aliased int;  -- lex.h:70
      lastStringDelim : aliased char;  -- lex.h:71
      pos : Interfaces.C.Strings.chars_ptr;  -- lex.h:72
      buf : Interfaces.C.Strings.chars_ptr;  -- lex.h:73
      filename : Interfaces.C.Strings.chars_ptr;  -- lex.h:74
      last_javadoc_comment : Interfaces.C.Strings.chars_ptr;  -- lex.h:75
      nb_symbols : aliased int;  -- lex.h:77
      nb_keywords : aliased int;  -- lex.h:77
      flags : aliased int;  -- lex.h:77
      symbols : aliased TCOD_lex_t_array2045;  -- lex.h:78
      keywords : aliased TCOD_lex_t_array2048;  -- lex.h:78
      simpleCmt : Interfaces.C.Strings.chars_ptr;  -- lex.h:79
      cmtStart : Interfaces.C.Strings.chars_ptr;  -- lex.h:80
      cmtStop : Interfaces.C.Strings.chars_ptr;  -- lex.h:80
      javadocCmtStart : Interfaces.C.Strings.chars_ptr;  -- lex.h:80
      stringDelim : Interfaces.C.Strings.chars_ptr;  -- lex.h:81
      javadoc_read : aliased Extensions.bool;  -- lex.h:82
      allocBuf : aliased Extensions.bool;  -- lex.h:83
      savept : aliased Extensions.bool;  -- lex.h:84
   end record
   with Convention => C_Pass_By_Copy;  -- lex.h:85

   function TCOD_lex_new_intern return access TCOD_lex_t  -- lex.h:87
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lex_new_intern";

   function TCOD_lex_new
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : Interfaces.C.Strings.chars_ptr;
      arg6 : Interfaces.C.Strings.chars_ptr;
      arg7 : Interfaces.C.Strings.chars_ptr;
      arg8 : int) return access TCOD_lex_t  -- lex.h:88
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lex_new";

   procedure TCOD_lex_delete (lex : access TCOD_lex_t)  -- lex.h:97
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lex_delete";

   procedure TCOD_lex_set_data_buffer (lex : access TCOD_lex_t; dat : Interfaces.C.Strings.chars_ptr)  -- lex.h:99
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lex_set_data_buffer";

   function TCOD_lex_set_data_file (lex : access TCOD_lex_t; filename : Interfaces.C.Strings.chars_ptr) return Extensions.bool  -- lex.h:100
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lex_set_data_file";

   function TCOD_lex_parse (lex : access TCOD_lex_t) return int  -- lex.h:102
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lex_parse";

   function TCOD_lex_parse_until_token_type (lex : access TCOD_lex_t; token_type : int) return int  -- lex.h:103
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lex_parse_until_token_type";

   function TCOD_lex_parse_until_token_value (lex : access TCOD_lex_t; token_value : Interfaces.C.Strings.chars_ptr) return int  -- lex.h:104
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lex_parse_until_token_value";

   function TCOD_lex_expect_token_type (lex : access TCOD_lex_t; token_type : int) return Extensions.bool  -- lex.h:106
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lex_expect_token_type";

   function TCOD_lex_expect_token_value
     (lex : access TCOD_lex_t;
      token_type : int;
      token_value : Interfaces.C.Strings.chars_ptr) return Extensions.bool  -- lex.h:107
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lex_expect_token_value";

   procedure TCOD_lex_savepoint (lex : access TCOD_lex_t; savept : access TCOD_lex_t)  -- lex.h:109
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lex_savepoint";

   procedure TCOD_lex_restore (lex : access TCOD_lex_t; savept : access TCOD_lex_t)  -- lex.h:110
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lex_restore";

   function TCOD_lex_get_last_javadoc (arg1 : access TCOD_lex_t) return Interfaces.C.Strings.chars_ptr  -- lex.h:111
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lex_get_last_javadoc";

   function TCOD_lex_get_token_name (arg1 : int) return Interfaces.C.Strings.chars_ptr  -- lex.h:112
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lex_get_token_name";

   function TCOD_lex_get_last_error return Interfaces.C.Strings.chars_ptr  -- lex.h:113
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lex_get_last_error";

   function TCOD_lex_hextoint (c : char) return int  -- lex.h:115
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lex_hextoint";

end lex_h;
