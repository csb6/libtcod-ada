pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with sys_utypes_uwint_t_h;
limited with ustdio_h;
with sys_utypes_uwchar_t_h;
with Interfaces.C.Strings;
with sys_utypes_usize_t_h;
limited with sys_utypes_umbstate_t_h;
with System;
limited with time_h;
with Interfaces.C.Extensions;

package wchar_h is

   --  unsupported macro: WCHAR_MIN __DARWIN_WCHAR_MIN
   --  unsupported macro: WCHAR_MAX __DARWIN_WCHAR_MAX
  ---
  -- * Copyright (c)1999 Citrus Project,
  -- * All rights reserved.
  -- *
  -- * Redistribution and use in source and binary forms, with or without
  -- * modification, are permitted provided that the following conditions
  -- * are met:
  -- * 1. Redistributions of source code must retain the above copyright
  -- *    notice, this list of conditions and the following disclaimer.
  -- * 2. Redistributions in binary form must reproduce the above copyright
  -- *    notice, this list of conditions and the following disclaimer in the
  -- *    documentation and/or other materials provided with the distribution.
  -- *
  -- * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
  -- * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  -- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
  -- * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
  -- * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  -- * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
  -- * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
  -- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
  -- * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
  -- * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
  -- * SUCH DAMAGE.
  -- *
  -- * $FreeBSD: /repoman/r/ncvs/src/include/wchar.h,v 1.34 2003/03/13 06:29:53 tjr Exp $
  --  

  ---
  -- * Copyright (c) 1999, 2000 The NetBSD Foundation, Inc.
  -- * All rights reserved.
  -- *
  -- * This code is derived from software contributed to The NetBSD Foundation
  -- * by Julian Coleman.
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
  -- *        This product includes software developed by the NetBSD
  -- *        Foundation, Inc. and its contributors.
  -- * 4. Neither the name of The NetBSD Foundation nor the names of its
  -- *    contributors may be used to endorse or promote products derived
  -- *    from this software without specific prior written permission.
  -- *
  -- * THIS SOFTWARE IS PROVIDED BY THE NETBSD FOUNDATION, INC. AND CONTRIBUTORS
  -- * ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
  -- * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
  -- * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE FOUNDATION OR CONTRIBUTORS
  -- * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
  -- * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
  -- * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
  -- * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
  -- * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
  -- * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
  -- * POSSIBILITY OF SUCH DAMAGE.
  -- *
  -- *	$NetBSD: wchar.h,v 1.8 2000/12/22 05:31:42 itojun Exp $
  --  

  -- Initially added in Issue 4  
   function btowc (arg1 : int) return sys_utypes_uwint_t_h.wint_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:97
   with Import => True, 
        Convention => C, 
        External_Name => "btowc";

   function fgetwc (arg1 : access ustdio_h.FILE) return sys_utypes_uwint_t_h.wint_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:98
   with Import => True, 
        Convention => C, 
        External_Name => "fgetwc";

   function fgetws
     (arg1 : access sys_utypes_uwchar_t_h.wchar_t;
      arg2 : int;
      arg3 : access ustdio_h.FILE) return access sys_utypes_uwchar_t_h.wchar_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:99
   with Import => True, 
        Convention => C, 
        External_Name => "fgetws";

   function fputwc (arg1 : sys_utypes_uwchar_t_h.wchar_t; arg2 : access ustdio_h.FILE) return sys_utypes_uwint_t_h.wint_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:100
   with Import => True, 
        Convention => C, 
        External_Name => "fputwc";

   function fputws (arg1 : access sys_utypes_uwchar_t_h.wchar_t; arg2 : access ustdio_h.FILE) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:101
   with Import => True, 
        Convention => C, 
        External_Name => "fputws";

   function fwide (arg1 : access ustdio_h.FILE; arg2 : int) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:102
   with Import => True, 
        Convention => C, 
        External_Name => "fwide";

   function fwprintf (arg1 : access ustdio_h.FILE; arg2 : access sys_utypes_uwchar_t_h.wchar_t  -- , ...
      ) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:103
   with Import => True, 
        Convention => C, 
        External_Name => "fwprintf";

   function fwscanf (arg1 : access ustdio_h.FILE; arg2 : access sys_utypes_uwchar_t_h.wchar_t  -- , ...
      ) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:104
   with Import => True, 
        Convention => C, 
        External_Name => "fwscanf";

   function getwc (arg1 : access ustdio_h.FILE) return sys_utypes_uwint_t_h.wint_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:105
   with Import => True, 
        Convention => C, 
        External_Name => "getwc";

   function getwchar return sys_utypes_uwint_t_h.wint_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:106
   with Import => True, 
        Convention => C, 
        External_Name => "getwchar";

   function mbrlen
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : sys_utypes_usize_t_h.size_t;
      arg3 : access sys_utypes_umbstate_t_h.mbstate_t) return sys_utypes_usize_t_h.size_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:107
   with Import => True, 
        Convention => C, 
        External_Name => "mbrlen";

   function mbrtowc
     (arg1 : access sys_utypes_uwchar_t_h.wchar_t;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : sys_utypes_usize_t_h.size_t;
      arg4 : access sys_utypes_umbstate_t_h.mbstate_t) return sys_utypes_usize_t_h.size_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:108
   with Import => True, 
        Convention => C, 
        External_Name => "mbrtowc";

   function mbsinit (arg1 : access constant sys_utypes_umbstate_t_h.mbstate_t) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:110
   with Import => True, 
        Convention => C, 
        External_Name => "mbsinit";

   function mbsrtowcs
     (arg1 : access sys_utypes_uwchar_t_h.wchar_t;
      arg2 : System.Address;
      arg3 : sys_utypes_usize_t_h.size_t;
      arg4 : access sys_utypes_umbstate_t_h.mbstate_t) return sys_utypes_usize_t_h.size_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:111
   with Import => True, 
        Convention => C, 
        External_Name => "mbsrtowcs";

   function putwc (arg1 : sys_utypes_uwchar_t_h.wchar_t; arg2 : access ustdio_h.FILE) return sys_utypes_uwint_t_h.wint_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:113
   with Import => True, 
        Convention => C, 
        External_Name => "putwc";

   function putwchar (arg1 : sys_utypes_uwchar_t_h.wchar_t) return sys_utypes_uwint_t_h.wint_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:114
   with Import => True, 
        Convention => C, 
        External_Name => "putwchar";

   function swprintf
     (arg1 : access sys_utypes_uwchar_t_h.wchar_t;
      arg2 : sys_utypes_usize_t_h.size_t;
      arg3 : access sys_utypes_uwchar_t_h.wchar_t  -- , ...
      ) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:115
   with Import => True, 
        Convention => C, 
        External_Name => "swprintf";

   function swscanf (arg1 : access sys_utypes_uwchar_t_h.wchar_t; arg2 : access sys_utypes_uwchar_t_h.wchar_t  -- , ...
      ) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:116
   with Import => True, 
        Convention => C, 
        External_Name => "swscanf";

   function ungetwc (arg1 : sys_utypes_uwint_t_h.wint_t; arg2 : access ustdio_h.FILE) return sys_utypes_uwint_t_h.wint_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:117
   with Import => True, 
        Convention => C, 
        External_Name => "ungetwc";

   function vfwprintf
     (arg1 : access ustdio_h.FILE;
      arg2 : access sys_utypes_uwchar_t_h.wchar_t;
      arg3 : access System.Address) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:118
   with Import => True, 
        Convention => C, 
        External_Name => "vfwprintf";

   function vswprintf
     (arg1 : access sys_utypes_uwchar_t_h.wchar_t;
      arg2 : sys_utypes_usize_t_h.size_t;
      arg3 : access sys_utypes_uwchar_t_h.wchar_t;
      arg4 : access System.Address) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:120
   with Import => True, 
        Convention => C, 
        External_Name => "vswprintf";

   function vwprintf (arg1 : access sys_utypes_uwchar_t_h.wchar_t; arg2 : access System.Address) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:122
   with Import => True, 
        Convention => C, 
        External_Name => "vwprintf";

   function wcrtomb
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : sys_utypes_uwchar_t_h.wchar_t;
      arg3 : access sys_utypes_umbstate_t_h.mbstate_t) return sys_utypes_usize_t_h.size_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:123
   with Import => True, 
        Convention => C, 
        External_Name => "wcrtomb";

   function wcscat (arg1 : access sys_utypes_uwchar_t_h.wchar_t; arg2 : access sys_utypes_uwchar_t_h.wchar_t) return access sys_utypes_uwchar_t_h.wchar_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:124
   with Import => True, 
        Convention => C, 
        External_Name => "wcscat";

   function wcschr (arg1 : access sys_utypes_uwchar_t_h.wchar_t; arg2 : sys_utypes_uwchar_t_h.wchar_t) return access sys_utypes_uwchar_t_h.wchar_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:125
   with Import => True, 
        Convention => C, 
        External_Name => "wcschr";

   function wcscmp (arg1 : access sys_utypes_uwchar_t_h.wchar_t; arg2 : access sys_utypes_uwchar_t_h.wchar_t) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:126
   with Import => True, 
        Convention => C, 
        External_Name => "wcscmp";

   function wcscoll (arg1 : access sys_utypes_uwchar_t_h.wchar_t; arg2 : access sys_utypes_uwchar_t_h.wchar_t) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:127
   with Import => True, 
        Convention => C, 
        External_Name => "wcscoll";

   function wcscpy (arg1 : access sys_utypes_uwchar_t_h.wchar_t; arg2 : access sys_utypes_uwchar_t_h.wchar_t) return access sys_utypes_uwchar_t_h.wchar_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:128
   with Import => True, 
        Convention => C, 
        External_Name => "wcscpy";

   function wcscspn (arg1 : access sys_utypes_uwchar_t_h.wchar_t; arg2 : access sys_utypes_uwchar_t_h.wchar_t) return sys_utypes_usize_t_h.size_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:129
   with Import => True, 
        Convention => C, 
        External_Name => "wcscspn";

   function wcsftime
     (arg1 : access sys_utypes_uwchar_t_h.wchar_t;
      arg2 : sys_utypes_usize_t_h.size_t;
      arg3 : access sys_utypes_uwchar_t_h.wchar_t;
      arg4 : access constant time_h.tm) return sys_utypes_usize_t_h.size_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:130
   with Import => True, 
        Convention => C, 
        External_Name => "_wcsftime";

   function wcslen (arg1 : access sys_utypes_uwchar_t_h.wchar_t) return sys_utypes_usize_t_h.size_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:132
   with Import => True, 
        Convention => C, 
        External_Name => "wcslen";

   function wcsncat
     (arg1 : access sys_utypes_uwchar_t_h.wchar_t;
      arg2 : access sys_utypes_uwchar_t_h.wchar_t;
      arg3 : sys_utypes_usize_t_h.size_t) return access sys_utypes_uwchar_t_h.wchar_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:133
   with Import => True, 
        Convention => C, 
        External_Name => "wcsncat";

   function wcsncmp
     (arg1 : access sys_utypes_uwchar_t_h.wchar_t;
      arg2 : access sys_utypes_uwchar_t_h.wchar_t;
      arg3 : sys_utypes_usize_t_h.size_t) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:134
   with Import => True, 
        Convention => C, 
        External_Name => "wcsncmp";

   function wcsncpy
     (arg1 : access sys_utypes_uwchar_t_h.wchar_t;
      arg2 : access sys_utypes_uwchar_t_h.wchar_t;
      arg3 : sys_utypes_usize_t_h.size_t) return access sys_utypes_uwchar_t_h.wchar_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:135
   with Import => True, 
        Convention => C, 
        External_Name => "wcsncpy";

   function wcspbrk (arg1 : access sys_utypes_uwchar_t_h.wchar_t; arg2 : access sys_utypes_uwchar_t_h.wchar_t) return access sys_utypes_uwchar_t_h.wchar_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:136
   with Import => True, 
        Convention => C, 
        External_Name => "wcspbrk";

   function wcsrchr (arg1 : access sys_utypes_uwchar_t_h.wchar_t; arg2 : sys_utypes_uwchar_t_h.wchar_t) return access sys_utypes_uwchar_t_h.wchar_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:137
   with Import => True, 
        Convention => C, 
        External_Name => "wcsrchr";

   function wcsrtombs
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : System.Address;
      arg3 : sys_utypes_usize_t_h.size_t;
      arg4 : access sys_utypes_umbstate_t_h.mbstate_t) return sys_utypes_usize_t_h.size_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:138
   with Import => True, 
        Convention => C, 
        External_Name => "wcsrtombs";

   function wcsspn (arg1 : access sys_utypes_uwchar_t_h.wchar_t; arg2 : access sys_utypes_uwchar_t_h.wchar_t) return sys_utypes_usize_t_h.size_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:140
   with Import => True, 
        Convention => C, 
        External_Name => "wcsspn";

   function wcsstr (arg1 : access sys_utypes_uwchar_t_h.wchar_t; arg2 : access sys_utypes_uwchar_t_h.wchar_t) return access sys_utypes_uwchar_t_h.wchar_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:141
   with Import => True, 
        Convention => C, 
        External_Name => "wcsstr";

   function wcsxfrm
     (arg1 : access sys_utypes_uwchar_t_h.wchar_t;
      arg2 : access sys_utypes_uwchar_t_h.wchar_t;
      arg3 : sys_utypes_usize_t_h.size_t) return sys_utypes_usize_t_h.size_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:142
   with Import => True, 
        Convention => C, 
        External_Name => "wcsxfrm";

   function wctob (arg1 : sys_utypes_uwint_t_h.wint_t) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:143
   with Import => True, 
        Convention => C, 
        External_Name => "wctob";

   function wcstod (arg1 : access sys_utypes_uwchar_t_h.wchar_t; arg2 : System.Address) return double  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:144
   with Import => True, 
        Convention => C, 
        External_Name => "wcstod";

   function wcstok
     (arg1 : access sys_utypes_uwchar_t_h.wchar_t;
      arg2 : access sys_utypes_uwchar_t_h.wchar_t;
      arg3 : System.Address) return access sys_utypes_uwchar_t_h.wchar_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:145
   with Import => True, 
        Convention => C, 
        External_Name => "wcstok";

   function wcstol
     (arg1 : access sys_utypes_uwchar_t_h.wchar_t;
      arg2 : System.Address;
      arg3 : int) return long  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:147
   with Import => True, 
        Convention => C, 
        External_Name => "wcstol";

   function wcstoul
     (arg1 : access sys_utypes_uwchar_t_h.wchar_t;
      arg2 : System.Address;
      arg3 : int) return unsigned_long  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:149
   with Import => True, 
        Convention => C, 
        External_Name => "wcstoul";

   function wmemchr
     (arg1 : access sys_utypes_uwchar_t_h.wchar_t;
      arg2 : sys_utypes_uwchar_t_h.wchar_t;
      arg3 : sys_utypes_usize_t_h.size_t) return access sys_utypes_uwchar_t_h.wchar_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:150
   with Import => True, 
        Convention => C, 
        External_Name => "wmemchr";

   function wmemcmp
     (arg1 : access sys_utypes_uwchar_t_h.wchar_t;
      arg2 : access sys_utypes_uwchar_t_h.wchar_t;
      arg3 : sys_utypes_usize_t_h.size_t) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:151
   with Import => True, 
        Convention => C, 
        External_Name => "wmemcmp";

   function wmemcpy
     (arg1 : access sys_utypes_uwchar_t_h.wchar_t;
      arg2 : access sys_utypes_uwchar_t_h.wchar_t;
      arg3 : sys_utypes_usize_t_h.size_t) return access sys_utypes_uwchar_t_h.wchar_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:152
   with Import => True, 
        Convention => C, 
        External_Name => "wmemcpy";

   function wmemmove
     (arg1 : access sys_utypes_uwchar_t_h.wchar_t;
      arg2 : access sys_utypes_uwchar_t_h.wchar_t;
      arg3 : sys_utypes_usize_t_h.size_t) return access sys_utypes_uwchar_t_h.wchar_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:153
   with Import => True, 
        Convention => C, 
        External_Name => "wmemmove";

   function wmemset
     (arg1 : access sys_utypes_uwchar_t_h.wchar_t;
      arg2 : sys_utypes_uwchar_t_h.wchar_t;
      arg3 : sys_utypes_usize_t_h.size_t) return access sys_utypes_uwchar_t_h.wchar_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:154
   with Import => True, 
        Convention => C, 
        External_Name => "wmemset";

   function wprintf (arg1 : access sys_utypes_uwchar_t_h.wchar_t  -- , ...
      ) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:155
   with Import => True, 
        Convention => C, 
        External_Name => "wprintf";

   function wscanf (arg1 : access sys_utypes_uwchar_t_h.wchar_t  -- , ...
      ) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:156
   with Import => True, 
        Convention => C, 
        External_Name => "wscanf";

   function wcswidth (arg1 : access sys_utypes_uwchar_t_h.wchar_t; arg2 : sys_utypes_usize_t_h.size_t) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:157
   with Import => True, 
        Convention => C, 
        External_Name => "wcswidth";

   function wcwidth (arg1 : sys_utypes_uwchar_t_h.wchar_t) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:158
   with Import => True, 
        Convention => C, 
        External_Name => "wcwidth";

  -- Additional functionality provided by:
  -- * POSIX.1-2001
  -- * ISO C99
  --  

   function vfwscanf
     (arg1 : access ustdio_h.FILE;
      arg2 : access sys_utypes_uwchar_t_h.wchar_t;
      arg3 : access System.Address) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:170
   with Import => True, 
        Convention => C, 
        External_Name => "vfwscanf";

   function vswscanf
     (arg1 : access sys_utypes_uwchar_t_h.wchar_t;
      arg2 : access sys_utypes_uwchar_t_h.wchar_t;
      arg3 : access System.Address) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:172
   with Import => True, 
        Convention => C, 
        External_Name => "vswscanf";

   function vwscanf (arg1 : access sys_utypes_uwchar_t_h.wchar_t; arg2 : access System.Address) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:174
   with Import => True, 
        Convention => C, 
        External_Name => "vwscanf";

   function wcstof (arg1 : access sys_utypes_uwchar_t_h.wchar_t; arg2 : System.Address) return float  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:175
   with Import => True, 
        Convention => C, 
        External_Name => "wcstof";

   function wcstold (arg1 : access sys_utypes_uwchar_t_h.wchar_t; arg2 : System.Address) return long_double  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:177
   with Import => True, 
        Convention => C, 
        External_Name => "wcstold";

   function wcstoll
     (arg1 : access sys_utypes_uwchar_t_h.wchar_t;
      arg2 : System.Address;
      arg3 : int) return Long_Long_Integer  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:180
   with Import => True, 
        Convention => C, 
        External_Name => "wcstoll";

   function wcstoull
     (arg1 : access sys_utypes_uwchar_t_h.wchar_t;
      arg2 : System.Address;
      arg3 : int) return Extensions.unsigned_long_long  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:182
   with Import => True, 
        Convention => C, 
        External_Name => "wcstoull";

  -- Additional functionality provided by:
  -- * POSIX.1-2008
  --  

   function mbsnrtowcs
     (arg1 : access sys_utypes_uwchar_t_h.wchar_t;
      arg2 : System.Address;
      arg3 : sys_utypes_usize_t_h.size_t;
      arg4 : sys_utypes_usize_t_h.size_t;
      arg5 : access sys_utypes_umbstate_t_h.mbstate_t) return sys_utypes_usize_t_h.size_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:195
   with Import => True, 
        Convention => C, 
        External_Name => "mbsnrtowcs";

   function wcpcpy (arg1 : access sys_utypes_uwchar_t_h.wchar_t; arg2 : access sys_utypes_uwchar_t_h.wchar_t) return access sys_utypes_uwchar_t_h.wchar_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:197
   with Import => True, 
        Convention => C, 
        External_Name => "wcpcpy";

   function wcpncpy
     (arg1 : access sys_utypes_uwchar_t_h.wchar_t;
      arg2 : access sys_utypes_uwchar_t_h.wchar_t;
      arg3 : sys_utypes_usize_t_h.size_t) return access sys_utypes_uwchar_t_h.wchar_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:198
   with Import => True, 
        Convention => C, 
        External_Name => "wcpncpy";

   function wcsdup (arg1 : access sys_utypes_uwchar_t_h.wchar_t) return access sys_utypes_uwchar_t_h.wchar_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:199
   with Import => True, 
        Convention => C, 
        External_Name => "wcsdup";

   function wcscasecmp (arg1 : access sys_utypes_uwchar_t_h.wchar_t; arg2 : access sys_utypes_uwchar_t_h.wchar_t) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:200
   with Import => True, 
        Convention => C, 
        External_Name => "wcscasecmp";

   function wcsncasecmp
     (arg1 : access sys_utypes_uwchar_t_h.wchar_t;
      arg2 : access sys_utypes_uwchar_t_h.wchar_t;
      n : sys_utypes_usize_t_h.size_t) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:201
   with Import => True, 
        Convention => C, 
        External_Name => "wcsncasecmp";

   function wcsnlen (arg1 : access sys_utypes_uwchar_t_h.wchar_t; arg2 : sys_utypes_usize_t_h.size_t) return sys_utypes_usize_t_h.size_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:202
   with Import => True, 
        Convention => C, 
        External_Name => "wcsnlen";

   function wcsnrtombs
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : System.Address;
      arg3 : sys_utypes_usize_t_h.size_t;
      arg4 : sys_utypes_usize_t_h.size_t;
      arg5 : access sys_utypes_umbstate_t_h.mbstate_t) return sys_utypes_usize_t_h.size_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:203
   with Import => True, 
        Convention => C, 
        External_Name => "wcsnrtombs";

   function open_wmemstream (arg1 : System.Address; arg2 : access sys_utypes_usize_t_h.size_t) return access ustdio_h.FILE  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:205
   with Import => True, 
        Convention => C, 
        External_Name => "open_wmemstream";

  -- Darwin extensions  
   function fgetwln (arg1 : access ustdio_h.FILE; arg2 : access sys_utypes_usize_t_h.size_t) return access sys_utypes_uwchar_t_h.wchar_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:215
   with Import => True, 
        Convention => C, 
        External_Name => "fgetwln";

   function wcslcat
     (arg1 : access sys_utypes_uwchar_t_h.wchar_t;
      arg2 : access sys_utypes_uwchar_t_h.wchar_t;
      arg3 : sys_utypes_usize_t_h.size_t) return sys_utypes_usize_t_h.size_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:216
   with Import => True, 
        Convention => C, 
        External_Name => "wcslcat";

   function wcslcpy
     (arg1 : access sys_utypes_uwchar_t_h.wchar_t;
      arg2 : access sys_utypes_uwchar_t_h.wchar_t;
      arg3 : sys_utypes_usize_t_h.size_t) return sys_utypes_usize_t_h.size_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/wchar.h:217
   with Import => True, 
        Convention => C, 
        External_Name => "wcslcpy";

  -- Poison the following routines if -fshort-wchar is set  
end wchar_h;
