pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;
with System;

package i386_utypes_h is

  -- * Copyright (c) 2000-2003 Apple Computer, Inc. All rights reserved.
  -- *
  -- * @APPLE_OSREFERENCE_LICENSE_HEADER_START@
  -- *
  -- * This file contains Original Code and/or Modifications of Original Code
  -- * as defined in and that are subject to the Apple Public Source License
  -- * Version 2.0 (the 'License'). You may not use this file except in
  -- * compliance with the License. The rights granted to you under the License
  -- * may not be used to create, or enable the creation or redistribution of,
  -- * unlawful or unlicensed copies of an Apple operating system, or to
  -- * circumvent, violate, or enable the circumvention or violation of, any
  -- * terms of an Apple operating system software license agreement.
  -- *
  -- * Please obtain a copy of the License at
  -- * http://www.opensource.apple.com/apsl/ and read it before using this file.
  -- *
  -- * The Original Code and all software distributed under the License are
  -- * distributed on an 'AS IS' basis, WITHOUT WARRANTY OF ANY KIND, EITHER
  -- * EXPRESS OR IMPLIED, AND APPLE HEREBY DISCLAIMS ALL SUCH WARRANTIES,
  -- * INCLUDING WITHOUT LIMITATION, ANY WARRANTIES OF MERCHANTABILITY,
  -- * FITNESS FOR A PARTICULAR PURPOSE, QUIET ENJOYMENT OR NON-INFRINGEMENT.
  -- * Please see the License for the specific language governing rights and
  -- * limitations under the License.
  -- *
  -- * @APPLE_OSREFERENCE_LICENSE_HEADER_END@
  --  

  -- * This header file contains integer types.  It's intended to also contain
  -- * flotaing point and other arithmetic types, as needed, later.
  --  

   subtype uu_int8_t is signed_char;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/i386/_types.h:37

   subtype uu_uint8_t is unsigned_char;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/i386/_types.h:41

   subtype uu_int16_t is short;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/i386/_types.h:42

   subtype uu_uint16_t is unsigned_short;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/i386/_types.h:43

   subtype uu_int32_t is int;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/i386/_types.h:44

   subtype uu_uint32_t is unsigned;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/i386/_types.h:45

   subtype uu_int64_t is Long_Long_Integer;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/i386/_types.h:46

   subtype uu_uint64_t is Extensions.unsigned_long_long;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/i386/_types.h:47

   subtype uu_darwin_intptr_t is long;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/i386/_types.h:49

   subtype uu_darwin_natural_t is unsigned;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/i386/_types.h:50

  -- * The rune type below is declared to be an ``int'' instead of the more natural
  -- * ``unsigned long'' or ``long''.  Two things are happening here.  It is not
  -- * unsigned so that EOF (-1) can be naturally assigned to it and used.  Also,
  -- * it looks like 10646 will be a 31 bit standard.  This means that if your
  -- * ints cannot hold 32 bits, you will be in trouble.  The reason an int was
  -- * chosen over a long is that the is*() and to*() routines take ints (says
  -- * ANSI C), but they use __darwin_ct_rune_t instead of int.  By changing it
  -- * here, you lose a bit of ANSI conformance, but your programs will still
  -- * work.
  -- *
  -- * NOTE: rune_t is not covered by ANSI nor other standards, and should not
  -- * be instantiated outside of lib/libc/locale.  Use wchar_t.  wchar_t and
  -- * rune_t must be the same type.  Also wint_t must be no narrower than
  -- * wchar_t, and should also be able to hold all members of the largest
  -- * character set plus one extra value (WEOF). wint_t must be at least 16 bits.
  --  

  -- ct_rune_t  
   subtype uu_darwin_ct_rune_t is int;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/i386/_types.h:70

  -- * mbstate_t is an opaque object to keep conversion state, during multibyte
  -- * stream conversions.  The content must not be referenced by user programs.
  --  

  -- for alignment  
   subtype uu_mbstate_t_array781 is Interfaces.C.char_array (0 .. 127);
   type uu_mbstate_t (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_mbstate8 : aliased uu_mbstate_t_array781;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/i386/_types.h:77
         when others =>
            u_mbstateL : aliased Long_Long_Integer;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/i386/_types.h:78
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/i386/_types.h:79

  -- mbstate_t  
   subtype uu_darwin_mbstate_t is uu_mbstate_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/i386/_types.h:81

  -- ptr1 - ptr2  
   subtype uu_darwin_ptrdiff_t is long;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/i386/_types.h:84

  -- ptr1 - ptr2  
  -- ptr1 - ptr2  
  -- sizeof()  
   subtype uu_darwin_size_t is unsigned_long;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/i386/_types.h:92

  -- sizeof()  
  -- va_list  
   subtype uu_darwin_va_list is System.Address;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/i386/_types.h:98

  -- va_list  
  -- wchar_t  
   subtype uu_darwin_wchar_t is int;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/i386/_types.h:104

  -- wchar_t  
  -- rune_t  
   subtype uu_darwin_rune_t is uu_darwin_wchar_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/i386/_types.h:109

  -- wint_t  
   subtype uu_darwin_wint_t is int;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/i386/_types.h:112

  -- wint_t  
  -- clock()  
   subtype uu_darwin_clock_t is unsigned_long;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/i386/_types.h:117

  -- socklen_t (duh)  
   subtype uu_darwin_socklen_t is uu_uint32_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/i386/_types.h:118

  -- byte count or error  
   subtype uu_darwin_ssize_t is long;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/i386/_types.h:119

  -- time()  
   subtype uu_darwin_time_t is long;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/i386/_types.h:120

end i386_utypes_h;
