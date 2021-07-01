pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;
with sys_utypes_uint32_t_h;
with Interfaces.C.Strings;
with color_h;
with mersenne_types_h;
with list_h;
with System;
limited with lex_h;

package parser_h is

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

  -- generic type  
   subtype TCOD_value_type_t is unsigned;
   TCOD_TYPE_NONE : constant unsigned := 0;
   TCOD_TYPE_BOOL : constant unsigned := 1;
   TCOD_TYPE_CHAR : constant unsigned := 2;
   TCOD_TYPE_INT : constant unsigned := 3;
   TCOD_TYPE_FLOAT : constant unsigned := 4;
   TCOD_TYPE_STRING : constant unsigned := 5;
   TCOD_TYPE_COLOR : constant unsigned := 6;
   TCOD_TYPE_DICE : constant unsigned := 7;
   TCOD_TYPE_VALUELIST00 : constant unsigned := 8;
   TCOD_TYPE_VALUELIST01 : constant unsigned := 9;
   TCOD_TYPE_VALUELIST02 : constant unsigned := 10;
   TCOD_TYPE_VALUELIST03 : constant unsigned := 11;
   TCOD_TYPE_VALUELIST04 : constant unsigned := 12;
   TCOD_TYPE_VALUELIST05 : constant unsigned := 13;
   TCOD_TYPE_VALUELIST06 : constant unsigned := 14;
   TCOD_TYPE_VALUELIST07 : constant unsigned := 15;
   TCOD_TYPE_VALUELIST08 : constant unsigned := 16;
   TCOD_TYPE_VALUELIST09 : constant unsigned := 17;
   TCOD_TYPE_VALUELIST10 : constant unsigned := 18;
   TCOD_TYPE_VALUELIST11 : constant unsigned := 19;
   TCOD_TYPE_VALUELIST12 : constant unsigned := 20;
   TCOD_TYPE_VALUELIST13 : constant unsigned := 21;
   TCOD_TYPE_VALUELIST14 : constant unsigned := 22;
   TCOD_TYPE_VALUELIST15 : constant unsigned := 23;
   TCOD_TYPE_CUSTOM00 : constant unsigned := 24;
   TCOD_TYPE_CUSTOM01 : constant unsigned := 25;
   TCOD_TYPE_CUSTOM02 : constant unsigned := 26;
   TCOD_TYPE_CUSTOM03 : constant unsigned := 27;
   TCOD_TYPE_CUSTOM04 : constant unsigned := 28;
   TCOD_TYPE_CUSTOM05 : constant unsigned := 29;
   TCOD_TYPE_CUSTOM06 : constant unsigned := 30;
   TCOD_TYPE_CUSTOM07 : constant unsigned := 31;
   TCOD_TYPE_CUSTOM08 : constant unsigned := 32;
   TCOD_TYPE_CUSTOM09 : constant unsigned := 33;
   TCOD_TYPE_CUSTOM10 : constant unsigned := 34;
   TCOD_TYPE_CUSTOM11 : constant unsigned := 35;
   TCOD_TYPE_CUSTOM12 : constant unsigned := 36;
   TCOD_TYPE_CUSTOM13 : constant unsigned := 37;
   TCOD_TYPE_CUSTOM14 : constant unsigned := 38;
   TCOD_TYPE_CUSTOM15 : constant unsigned := 39;
   TCOD_TYPE_LIST : constant unsigned := 1024;  -- parser.h:87

  -- generic value  
   type TCOD_value_t (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            b : aliased Extensions.bool;  -- parser.h:91
         when 1 =>
            c : aliased char;  -- parser.h:92
         when 2 =>
            i : aliased sys_utypes_uint32_t_h.int32_t;  -- parser.h:93
         when 3 =>
            f : aliased float;  -- parser.h:94
         when 4 =>
            s : Interfaces.C.Strings.chars_ptr;  -- parser.h:95
         when 5 =>
            col : aliased color_h.TCOD_color_t;  -- parser.h:96
         when 6 =>
            dice : aliased mersenne_types_h.TCOD_dice_t;  -- parser.h:97
         when 7 =>
            list : list_h.TCOD_list_t;  -- parser.h:98
         when others =>
            custom : System.Address;  -- parser.h:99
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;  -- parser.h:100

  -- parser structures  
   type TCOD_ParserStruct;
   type TCOD_parser_struct_t is access all TCOD_ParserStruct;  -- parser.h:104

   function TCOD_struct_get_name (arg1 : TCOD_parser_struct_t) return Interfaces.C.Strings.chars_ptr  -- parser.h:105
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_struct_get_name";

   procedure TCOD_struct_add_property
     (def : TCOD_parser_struct_t;
      name : Interfaces.C.Strings.chars_ptr;
      c_type : TCOD_value_type_t;
      mandatory : Extensions.bool)  -- parser.h:106
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_struct_add_property";

   procedure TCOD_struct_add_list_property
     (def : TCOD_parser_struct_t;
      name : Interfaces.C.Strings.chars_ptr;
      c_type : TCOD_value_type_t;
      mandatory : Extensions.bool)  -- parser.h:108
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_struct_add_list_property";

   procedure TCOD_struct_add_value_list
     (def : TCOD_parser_struct_t;
      name : Interfaces.C.Strings.chars_ptr;
      value_list : System.Address;
      mandatory : Extensions.bool)  -- parser.h:110
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_struct_add_value_list";

   procedure TCOD_struct_add_value_list_sized
     (def : TCOD_parser_struct_t;
      name : Interfaces.C.Strings.chars_ptr;
      value_list : System.Address;
      size : int;
      mandatory : Extensions.bool)  -- parser.h:112
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_struct_add_value_list_sized";

   procedure TCOD_struct_add_flag (def : TCOD_parser_struct_t; propname : Interfaces.C.Strings.chars_ptr)  -- parser.h:114
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_struct_add_flag";

   procedure TCOD_struct_add_structure (def : TCOD_parser_struct_t; sub_structure : TCOD_parser_struct_t)  -- parser.h:115
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_struct_add_structure";

   function TCOD_struct_is_mandatory (def : TCOD_parser_struct_t; propname : Interfaces.C.Strings.chars_ptr) return Extensions.bool  -- parser.h:116
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_struct_is_mandatory";

   function TCOD_struct_get_type (def : TCOD_parser_struct_t; propname : Interfaces.C.Strings.chars_ptr) return TCOD_value_type_t  -- parser.h:117
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_struct_get_type";

  -- parser listener  
   type TCOD_parser_listener_t is record
      new_struct : access function (arg1 : TCOD_parser_struct_t; arg2 : Interfaces.C.Strings.chars_ptr) return Extensions.bool;  -- parser.h:121
      new_flag : access function (arg1 : Interfaces.C.Strings.chars_ptr) return Extensions.bool;  -- parser.h:122
      new_property : access function
           (arg1 : Interfaces.C.Strings.chars_ptr;
            arg2 : TCOD_value_type_t;
            arg3 : TCOD_value_t) return Extensions.bool;  -- parser.h:123
      end_struct : access function (arg1 : TCOD_parser_struct_t; arg2 : Interfaces.C.Strings.chars_ptr) return Extensions.bool;  -- parser.h:124
      error : access procedure (arg1 : Interfaces.C.Strings.chars_ptr);  -- parser.h:125
   end record
   with Convention => C_Pass_By_Copy;  -- parser.h:126

  -- a custom type parser  
   type TCOD_parser_custom_t is access function
        (arg1 : access lex_h.TCOD_lex_t;
         arg2 : access TCOD_parser_listener_t;
         arg3 : TCOD_parser_struct_t;
         arg4 : Interfaces.C.Strings.chars_ptr) return TCOD_value_t
   with Convention => C;  -- parser.h:129

  -- the parser  
   type TCOD_Parser;
   type TCOD_parser_t is access all TCOD_Parser;  -- parser.h:134

   function TCOD_parser_new return TCOD_parser_t  -- parser.h:136
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_parser_new";

   function TCOD_parser_new_struct (parser : TCOD_parser_t; name : Interfaces.C.Strings.chars_ptr) return TCOD_parser_struct_t  -- parser.h:137
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_parser_new_struct";

   function TCOD_parser_new_custom_type (parser : TCOD_parser_t; custom_type_parser : TCOD_parser_custom_t) return TCOD_value_type_t  -- parser.h:139
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_parser_new_custom_type";

   procedure TCOD_parser_run
     (parser : TCOD_parser_t;
      filename : Interfaces.C.Strings.chars_ptr;
      listener : access TCOD_parser_listener_t)  -- parser.h:140
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_parser_run";

   procedure TCOD_parser_delete (parser : TCOD_parser_t)  -- parser.h:141
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_parser_delete";

  -- error during parsing. can be called by the parser listener  
   procedure TCOD_parser_error (msg : Interfaces.C.Strings.chars_ptr  -- , ...
      )  -- parser.h:144
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_parser_error";

  -- default parser listener  
   function TCOD_parser_has_property (parser : TCOD_parser_t; name : Interfaces.C.Strings.chars_ptr) return Extensions.bool  -- parser.h:146
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_parser_has_property";

   function TCOD_parser_get_bool_property (parser : TCOD_parser_t; name : Interfaces.C.Strings.chars_ptr) return Extensions.bool  -- parser.h:147
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_parser_get_bool_property";

   function TCOD_parser_get_char_property (parser : TCOD_parser_t; name : Interfaces.C.Strings.chars_ptr) return int  -- parser.h:148
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_parser_get_char_property";

   function TCOD_parser_get_int_property (parser : TCOD_parser_t; name : Interfaces.C.Strings.chars_ptr) return int  -- parser.h:149
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_parser_get_int_property";

   function TCOD_parser_get_float_property (parser : TCOD_parser_t; name : Interfaces.C.Strings.chars_ptr) return float  -- parser.h:150
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_parser_get_float_property";

   function TCOD_parser_get_string_property (arg1 : TCOD_parser_t; arg2 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- parser.h:151
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_parser_get_string_property";

   function TCOD_parser_get_color_property (parser : TCOD_parser_t; name : Interfaces.C.Strings.chars_ptr) return color_h.TCOD_color_t  -- parser.h:152
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_parser_get_color_property";

   function TCOD_parser_get_dice_property (parser : TCOD_parser_t; name : Interfaces.C.Strings.chars_ptr) return mersenne_types_h.TCOD_dice_t  -- parser.h:153
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_parser_get_dice_property";

   procedure TCOD_parser_get_dice_property_py
     (parser : TCOD_parser_t;
      name : Interfaces.C.Strings.chars_ptr;
      dice : access mersenne_types_h.TCOD_dice_t)  -- parser.h:154
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_parser_get_dice_property_py";

   function TCOD_parser_get_custom_property (arg1 : TCOD_parser_t; arg2 : Interfaces.C.Strings.chars_ptr) return System.Address  -- parser.h:155
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_parser_get_custom_property";

   function TCOD_parser_get_list_property
     (parser : TCOD_parser_t;
      name : Interfaces.C.Strings.chars_ptr;
      c_type : TCOD_value_type_t) return list_h.TCOD_list_t  -- parser.h:156
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_parser_get_list_property";

  -- parser internals (may be used by custom type parsers)  
  -- parser structures  
  -- entity type name  
   type TCOD_ParserStruct is record
      name : Interfaces.C.Strings.chars_ptr;  -- parser.h:161
      flags : list_h.TCOD_list_t;  -- parser.h:163
      props : list_h.TCOD_list_t;  -- parser.h:165
      lists : list_h.TCOD_list_t;  -- parser.h:167
      structs : list_h.TCOD_list_t;  -- parser.h:169
   end record
   with Convention => C_Pass_By_Copy;  -- parser.h:160

  -- list of flags  
  -- list of properties (name, type, mandatory)  
  -- list of value lists  
  -- list of sub-structures  
   subtype TCOD_struct_int_t is TCOD_ParserStruct;  -- parser.h:170

  -- the parser  
  -- list of structures  
   type anon1532_array1568 is array (0 .. 15) of TCOD_parser_custom_t;
   type TCOD_Parser is record
      structs : list_h.TCOD_list_t;  -- parser.h:174
      customs : anon1532_array1568;  -- parser.h:176
      fatal : aliased Extensions.bool;  -- parser.h:178
      props : list_h.TCOD_list_t;  -- parser.h:180
   end record
   with Convention => C_Pass_By_Copy;  -- parser.h:172

  -- list of custom type parsers  
  -- fatal error occurred  
  -- list of properties if default listener is used  
   subtype TCOD_parser_int_t is TCOD_Parser;  -- parser.h:181

   function TCOD_parse_bool_value return TCOD_value_t  -- parser.h:182
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_parse_bool_value";

   function TCOD_parse_char_value return TCOD_value_t  -- parser.h:183
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_parse_char_value";

   function TCOD_parse_integer_value return TCOD_value_t  -- parser.h:184
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_parse_integer_value";

   function TCOD_parse_float_value return TCOD_value_t  -- parser.h:185
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_parse_float_value";

   function TCOD_parse_string_value return TCOD_value_t  -- parser.h:186
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_parse_string_value";

   function TCOD_parse_color_value return TCOD_value_t  -- parser.h:187
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_parse_color_value";

   function TCOD_parse_dice_value return TCOD_value_t  -- parser.h:188
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_parse_dice_value";

   function TCOD_parse_value_list_value (def : access TCOD_struct_int_t; listnum : int) return TCOD_value_t  -- parser.h:189
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_parse_value_list_value";

   function TCOD_parse_property_value
     (parser : access TCOD_parser_int_t;
      def : TCOD_parser_struct_t;
      propname : Interfaces.C.Strings.chars_ptr;
      list : Extensions.bool) return TCOD_value_t  -- parser.h:191
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_parse_property_value";

end parser_h;
