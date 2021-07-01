pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with sys_utypes_uwint_t_h;
with utypes_uwctype_t_h;
with Interfaces.C.Strings;

package uwctype_h is

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
  --  

  -- * Common header for wctype.h and wchar.h
  -- *
  -- * Contains everything required by wctype.h except:
  -- *
  -- *	#include <_types/_wctrans_t.h>
  -- *	int iswblank(wint_t);
  -- *	wint_t towctrans(wint_t, wctrans_t);
  -- *	wctrans_t wctrans(const char *);
  --  

  -- * Use inline functions if we are allowed to and the compiler supports them.
  --  

   function iswalnum (u_wc : sys_utypes_uwint_t_h.wint_t) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_wctype.h:51
   with Import => True, 
        Convention => C, 
        External_Name => "iswalnum";

   function iswalpha (u_wc : sys_utypes_uwint_t_h.wint_t) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_wctype.h:57
   with Import => True, 
        Convention => C, 
        External_Name => "iswalpha";

   function iswcntrl (u_wc : sys_utypes_uwint_t_h.wint_t) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_wctype.h:63
   with Import => True, 
        Convention => C, 
        External_Name => "iswcntrl";

   function iswctype (u_wc : sys_utypes_uwint_t_h.wint_t; u_charclass : utypes_uwctype_t_h.wctype_t) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_wctype.h:69
   with Import => True, 
        Convention => C, 
        External_Name => "iswctype";

   function iswdigit (u_wc : sys_utypes_uwint_t_h.wint_t) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_wctype.h:75
   with Import => True, 
        Convention => C, 
        External_Name => "iswdigit";

   function iswgraph (u_wc : sys_utypes_uwint_t_h.wint_t) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_wctype.h:81
   with Import => True, 
        Convention => C, 
        External_Name => "iswgraph";

   function iswlower (u_wc : sys_utypes_uwint_t_h.wint_t) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_wctype.h:87
   with Import => True, 
        Convention => C, 
        External_Name => "iswlower";

   function iswprint (u_wc : sys_utypes_uwint_t_h.wint_t) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_wctype.h:93
   with Import => True, 
        Convention => C, 
        External_Name => "iswprint";

   function iswpunct (u_wc : sys_utypes_uwint_t_h.wint_t) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_wctype.h:99
   with Import => True, 
        Convention => C, 
        External_Name => "iswpunct";

   function iswspace (u_wc : sys_utypes_uwint_t_h.wint_t) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_wctype.h:105
   with Import => True, 
        Convention => C, 
        External_Name => "iswspace";

   function iswupper (u_wc : sys_utypes_uwint_t_h.wint_t) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_wctype.h:111
   with Import => True, 
        Convention => C, 
        External_Name => "iswupper";

   function iswxdigit (u_wc : sys_utypes_uwint_t_h.wint_t) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_wctype.h:117
   with Import => True, 
        Convention => C, 
        External_Name => "iswxdigit";

   function towlower (u_wc : sys_utypes_uwint_t_h.wint_t) return sys_utypes_uwint_t_h.wint_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_wctype.h:123
   with Import => True, 
        Convention => C, 
        External_Name => "towlower";

   function towupper (u_wc : sys_utypes_uwint_t_h.wint_t) return sys_utypes_uwint_t_h.wint_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_wctype.h:129
   with Import => True, 
        Convention => C, 
        External_Name => "towupper";

   function wctype (arg1 : Interfaces.C.Strings.chars_ptr) return utypes_uwctype_t_h.wctype_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_wctype.h:157
   with Import => True, 
        Convention => C, 
        External_Name => "wctype";

end uwctype_h;
