pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package uctype_h is

  -- * Copyright (c) 2000, 2005, 2008 Apple Inc. All rights reserved.
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

  -- * Copyright (c) 1989, 1993
  -- *	The Regents of the University of California.  All rights reserved.
  -- * (c) UNIX System Laboratories, Inc.
  -- * All or some portions of this file are derived from material licensed
  -- * to the University of California by American Telephone and Telegraph
  -- * Co. or Unix System Laboratories, Inc. and are reproduced herein with
  -- * the permission of UNIX System Laboratories, Inc.
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
  -- *	@(#)ctype.h	8.4 (Berkeley) 1/21/94
  --  

  -- * Backward compatibility
  --  

  -- * Use inline functions if we are allowed to and the compiler supports them.
  --  

  -- See comments in <machine/_type.h> about __darwin_ct_rune_t.  
   --  skipped func ___runetype

   --  skipped func ___tolower

   --  skipped func ___toupper

   function isascii (u_c : int) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_ctype.h:135
   with Import => True, 
        Convention => C, 
        External_Name => "isascii";

   --  skipped func __maskrune

   --  skipped func __istype

   --  skipped func __isctype

   --  skipped func __toupper

   --  skipped func __tolower

   --  skipped func __wcwidth

   function isalnum (u_c : int) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_ctype.h:212
   with Import => True, 
        Convention => C, 
        External_Name => "isalnum";

   function isalpha (u_c : int) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_ctype.h:218
   with Import => True, 
        Convention => C, 
        External_Name => "isalpha";

   function isblank (u_c : int) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_ctype.h:224
   with Import => True, 
        Convention => C, 
        External_Name => "isblank";

   function iscntrl (u_c : int) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_ctype.h:230
   with Import => True, 
        Convention => C, 
        External_Name => "iscntrl";

  -- ANSI -- locale independent  
   function isdigit (u_c : int) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_ctype.h:237
   with Import => True, 
        Convention => C, 
        External_Name => "isdigit";

   function isgraph (u_c : int) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_ctype.h:243
   with Import => True, 
        Convention => C, 
        External_Name => "isgraph";

   function islower (u_c : int) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_ctype.h:249
   with Import => True, 
        Convention => C, 
        External_Name => "islower";

   function isprint (u_c : int) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_ctype.h:255
   with Import => True, 
        Convention => C, 
        External_Name => "isprint";

   function ispunct (u_c : int) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_ctype.h:261
   with Import => True, 
        Convention => C, 
        External_Name => "ispunct";

   function isspace (u_c : int) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_ctype.h:267
   with Import => True, 
        Convention => C, 
        External_Name => "isspace";

   function isupper (u_c : int) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_ctype.h:273
   with Import => True, 
        Convention => C, 
        External_Name => "isupper";

  -- ANSI -- locale independent  
   function isxdigit (u_c : int) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_ctype.h:280
   with Import => True, 
        Convention => C, 
        External_Name => "isxdigit";

   function toascii (u_c : int) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_ctype.h:286
   with Import => True, 
        Convention => C, 
        External_Name => "toascii";

   function tolower (u_c : int) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_ctype.h:292
   with Import => True, 
        Convention => C, 
        External_Name => "tolower";

   function toupper (u_c : int) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_ctype.h:298
   with Import => True, 
        Convention => C, 
        External_Name => "toupper";

   function digittoint (u_c : int) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_ctype.h:305
   with Import => True, 
        Convention => C, 
        External_Name => "digittoint";

   function ishexnumber (u_c : int) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_ctype.h:311
   with Import => True, 
        Convention => C, 
        External_Name => "ishexnumber";

   function isideogram (u_c : int) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_ctype.h:317
   with Import => True, 
        Convention => C, 
        External_Name => "isideogram";

   function isnumber (u_c : int) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_ctype.h:323
   with Import => True, 
        Convention => C, 
        External_Name => "isnumber";

   function isphonogram (u_c : int) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_ctype.h:329
   with Import => True, 
        Convention => C, 
        External_Name => "isphonogram";

   function isrune (u_c : int) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_ctype.h:335
   with Import => True, 
        Convention => C, 
        External_Name => "isrune";

   function isspecial (u_c : int) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_ctype.h:341
   with Import => True, 
        Convention => C, 
        External_Name => "isspecial";

end uctype_h;
