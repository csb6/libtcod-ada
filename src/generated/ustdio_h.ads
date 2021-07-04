pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with sys_utypes_h;
with System;
with Interfaces.C.Strings;

package ustdio_h is

  -- * Copyright (c) 2000, 2005, 2007, 2009, 2010 Apple Inc. All rights reserved.
  -- *
  -- * @APPLE_LICENSE_HEADER_START@
  -- *
  -- * This file contains Original Code and/or Modifications of Original Code
  -- * as defined in and that are subject to the Apple Public Source License
  -- * Version 2.0 (the 'License'). You may not use this file except in
  -- * compliance with the License. Please obtain a copy of the License at
  -- * http://www.opensource.apple.com/apsl/ and read it before using this
  -- * file.
  -- *
  -- * The Original Code and all software distributed under the License are
  -- * distributed on an 'AS IS' basis, WITHOUT WARRANTY OF ANY KIND, EITHER
  -- * EXPRESS OR IMPLIED, AND APPLE HEREBY DISCLAIMS ALL SUCH WARRANTIES,
  -- * INCLUDING WITHOUT LIMITATION, ANY WARRANTIES OF MERCHANTABILITY,
  -- * FITNESS FOR A PARTICULAR PURPOSE, QUIET ENJOYMENT OR NON-INFRINGEMENT.
  -- * Please see the License for the specific language governing rights and
  -- * limitations under the License.
  -- *
  -- * @APPLE_LICENSE_HEADER_END@
  --  

  ---
  -- * Copyright (c) 1990, 1993
  -- *	The Regents of the University of California.  All rights reserved.
  -- *
  -- * This code is derived from software contributed to Berkeley by
  -- * Chris Torek.
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
  -- *	@(#)stdio.h	8.5 (Berkeley) 4/29/95
  --  

  -- * Common header for stdio.h and xlocale/_stdio.h
  --  

  -- DO NOT REMOVE THIS COMMENT: fixincludes needs to see:
  -- * __gnuc_va_list and include <stdarg.h>  

   subtype fpos_t is sys_utypes_h.uu_darwin_off_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_stdio.h:81

  -- * NB: to fit things in six character monocase externals, the stdio
  -- * code uses the prefix `__s' for stdio objects, typically followed
  -- * by a three-character attempt at a mnemonic.
  --  

  -- stdio buffers  
   type uu_sbuf is record
      u_base : access unsigned_char;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_stdio.h:93
      u_size : aliased int;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_stdio.h:94
   end record
   with Convention => C_Pass_By_Copy;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_stdio.h:92

  -- hold a buncha junk that would grow the ABI  
   type uu_sFILEX is null record;   -- incomplete struct

  -- * stdio state variables.
  -- *
  -- * The following always hold:
  -- *
  -- *	if (_flags&(__SLBF|__SWR)) == (__SLBF|__SWR),
  -- *		_lbfsize is -_bf._size, else _lbfsize is 0
  -- *	if _flags&__SRD, _w is 0
  -- *	if _flags&__SWR, _r is 0
  -- *
  -- * This ensures that the getc and putc macros (or inline functions) never
  -- * try to write or read from a file that is in `read' or `write' mode.
  -- * (Moreover, they can, and do, automatically switch from read mode to
  -- * write mode, and back, on "r+" and "w+" files.)
  -- *
  -- * _lbfsize is used only to make the inline line-buffered output stream
  -- * code as compact as possible.
  -- *
  -- * _ub, _up, and _ur are used when ungetc() pushes back more characters
  -- * than fit in the current _bf, or when ungetc() pushes back a character
  -- * that does not match the previous one in _bf.  When this happens,
  -- * _ub._base becomes non-nil (i.e., a stream has ungetc() data iff
  -- * _ub._base!=NULL) and _up and _ur save the current values of _p and _r.
  -- *
  -- * NB: see WARNING above before changing the layout of this structure!
  --  

  -- current position in (some) buffer  
   type anon887_array899 is array (0 .. 2) of aliased unsigned_char;
   type anon887_array900 is array (0 .. 0) of aliased unsigned_char;
   type uu_sFILE is record
      u_p : access unsigned_char;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_stdio.h:127
      u_r : aliased int;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_stdio.h:128
      u_w : aliased int;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_stdio.h:129
      u_flags : aliased short;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_stdio.h:130
      u_file : aliased short;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_stdio.h:131
      u_bf : aliased uu_sbuf;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_stdio.h:132
      u_lbfsize : aliased int;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_stdio.h:133
      u_cookie : System.Address;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_stdio.h:136
      u_close : access function (arg1 : System.Address) return int;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_stdio.h:137
      u_read : access function
           (arg1 : System.Address;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : int) return int;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_stdio.h:138
      u_seek : access function
           (arg1 : System.Address;
            arg2 : fpos_t;
            arg3 : int) return fpos_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_stdio.h:139
      u_write : access function
           (arg1 : System.Address;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : int) return int;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_stdio.h:140
      u_ub : aliased uu_sbuf;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_stdio.h:143
      u_extra : access uu_sFILEX;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_stdio.h:144
      u_ur : aliased int;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_stdio.h:145
      u_ubuf : aliased anon887_array899;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_stdio.h:148
      u_nbuf : aliased anon887_array900;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_stdio.h:149
      u_lb : aliased uu_sbuf;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_stdio.h:152
      u_blksize : aliased int;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_stdio.h:155
      u_offset : aliased fpos_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_stdio.h:156
   end record
   with Convention => C_Pass_By_Copy;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_stdio.h:126

  -- read space left for getc()  
  -- write space left for putc()  
  -- flags, below; this FILE is free if 0  
  -- fileno, if Unix descriptor, else -1  
  -- the buffer (at least 1 byte, if !NULL)  
  -- 0 or -_bf._size, for inline putc  
  -- operations  
  -- cookie passed to io functions  
  -- separate buffer for long sequences of ungetc()  
  -- ungetc buffer  
  -- additions to FILE to not break ABI  
  -- saved _r when _r is counting ungetc data  
  -- tricks to meet minimum requirements even when malloc() fails  
  -- guarantee an ungetc() buffer  
  -- guarantee a getc() buffer  
  -- separate buffer for fgetln() when line crosses buffer boundary  
  -- buffer for fgetln()  
  -- Unix stdio files get aligned to block boundaries on fseek()  
  -- stat.st_blksize (may be != _bf._size)  
  -- current lseek offset (see WARNING)  
   subtype FILE is uu_sFILE;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_stdio.h:157

end ustdio_h;
