pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with i386_utypes_h;
with Interfaces.C.Strings;
with System;

package runetype_h is

  ---
  -- * Copyright (c) 1993
  -- *	The Regents of the University of California.  All rights reserved.
  -- *
  -- * This code is derived from software contributed to Berkeley by
  -- * Paul Borman at Krystal Technologies.
  -- *
  -- * Redistribution and use in source and binary forms, with or without
  -- * modification, are permitted provided that the following conditions
  -- * are met:
  -- * 1. Redistributions of source code must retain the above copyright
  -- *    notice, this list of conditions and the following disclaimer.
  -- * 2. Redistributions in binary form must reproduce the above copyright
  -- *    notice, this list of conditions and the following disclaimer in the
  -- *    documentation and/or other materials provided with the distribution.
  -- * 3. All advertising materials mentioning features or use of this software
  -- *    must display the following acknowledgement:
  -- *	This product includes software developed by the University of
  -- *	California, Berkeley and its contributors.
  -- * 4. Neither the name of the University nor the names of its contributors
  -- *    may be used to endorse or promote products derived from this software
  -- *    without specific prior written permission.
  -- *
  -- * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
  -- * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  -- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
  -- * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
  -- * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  -- * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
  -- * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
  -- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
  -- * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
  -- * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
  -- * SUCH DAMAGE.
  -- *
  -- *	@(#)runetype.h	8.1 (Berkeley) 6/2/93
  --  

  -- * The lower 8 bits of runetype[] contain the digit value of the rune.
  --  

  -- First rune of the range  
  -- Last rune (inclusive) of the range  
  -- What first maps to in maps  
  -- Array of types in range  
   type u_RuneEntry is record
      uu_min : aliased i386_utypes_h.uu_darwin_rune_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/runetype.h:61
      uu_max : aliased i386_utypes_h.uu_darwin_rune_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/runetype.h:62
      uu_map : aliased i386_utypes_h.uu_darwin_rune_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/runetype.h:63
      uu_types : access i386_utypes_h.uu_uint32_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/runetype.h:64
   end record
   with Convention => C_Pass_By_Copy;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/runetype.h:65

  -- Number of ranges stored  
  -- Pointer to the ranges  
   type u_RuneRange is record
      uu_nranges : aliased int;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/runetype.h:68
      uu_ranges : access u_RuneEntry;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/runetype.h:69
   end record
   with Convention => C_Pass_By_Copy;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/runetype.h:70

  -- CHARCLASS_NAME_MAX = 14  
  -- charclass mask  
   subtype u_RuneCharClass_array1132 is Interfaces.C.char_array (0 .. 13);
   type u_RuneCharClass is record
      uu_name : aliased u_RuneCharClass_array1132;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/runetype.h:73
      uu_mask : aliased i386_utypes_h.uu_uint32_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/runetype.h:74
   end record
   with Convention => C_Pass_By_Copy;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/runetype.h:75

  -- Magic saying what version we are  
  -- ASCII name of this encoding  
  --	 * The following are to deal with Runes larger than _CACHED_RUNES - 1.
  --	 * Their data is actually contiguous with this structure so as to make
  --	 * it easier to read/write from/to disk.
  --	  

  -- Data which depends on the encoding  
  -- how long that data is  
  --	 * extra fields to deal with arbitrary character classes
  --	  

   subtype u_RuneLocale_array828 is Interfaces.C.char_array (0 .. 7);
   subtype u_RuneLocale_array1136 is Interfaces.C.char_array (0 .. 31);
   type u_RuneLocale_array1147 is array (0 .. 255) of aliased i386_utypes_h.uu_uint32_t;
   type u_RuneLocale_array1149 is array (0 .. 255) of aliased i386_utypes_h.uu_darwin_rune_t;
   type u_RuneLocale is record
      uu_magic : aliased u_RuneLocale_array828;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/runetype.h:78
      uu_encoding : aliased u_RuneLocale_array1136;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/runetype.h:79
      uu_sgetrune : access function
           (arg1 : Interfaces.C.Strings.chars_ptr;
            arg2 : i386_utypes_h.uu_darwin_size_t;
            arg3 : System.Address) return i386_utypes_h.uu_darwin_rune_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/runetype.h:81
      uu_sputrune : access function
           (arg1 : i386_utypes_h.uu_darwin_rune_t;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : i386_utypes_h.uu_darwin_size_t;
            arg4 : System.Address) return int;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/runetype.h:82
      uu_invalid_rune : aliased i386_utypes_h.uu_darwin_rune_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/runetype.h:83
      uu_runetype : aliased u_RuneLocale_array1147;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/runetype.h:85
      uu_maplower : aliased u_RuneLocale_array1149;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/runetype.h:86
      uu_mapupper : aliased u_RuneLocale_array1149;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/runetype.h:87
      uu_runetype_ext : aliased u_RuneRange;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/runetype.h:94
      uu_maplower_ext : aliased u_RuneRange;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/runetype.h:95
      uu_mapupper_ext : aliased u_RuneRange;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/runetype.h:96
      uu_variable : System.Address;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/runetype.h:98
      uu_variable_len : aliased int;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/runetype.h:99
      uu_ncharclasses : aliased int;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/runetype.h:104
      uu_charclasses : access u_RuneCharClass;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/runetype.h:105
   end record
   with Convention => C_Pass_By_Copy;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/runetype.h:106

end runetype_h;
