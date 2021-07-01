pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package secure_ustdio_h is

   --  unsupported macro: sprintf(str,...) __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
   --  unsupported macro: snprintf(str,len,...) __builtin___snprintf_chk (str, len, 0, __darwin_obsz(str), __VA_ARGS__)
   --  arg-macro: procedure vsprintf (str, format, ap)
   --    __builtin___vsprintf_chk (str, 0, __darwin_obsz(str), format, ap)
   --  arg-macro: procedure vsnprintf (str, len, format, ap)
   --    __builtin___vsnprintf_chk (str, len, 0, __darwin_obsz(str), format, ap)
  -- * Copyright (c) 2007, 2010 Apple Inc. All rights reserved.
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

  -- sprintf, vsprintf, snprintf, vsnprintf  
   --  skipped func __sprintf_chk

   --  skipped func __snprintf_chk

   --  skipped func __vsprintf_chk

   --  skipped func __vsnprintf_chk

end secure_ustdio_h;
