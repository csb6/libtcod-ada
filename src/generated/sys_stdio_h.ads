pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;

package sys_stdio_h is

   RENAME_SECLUDE : constant := 16#00000001#;  --  /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/stdio.h:43
   RENAME_SWAP : constant := 16#00000002#;  --  /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/stdio.h:44
   RENAME_EXCL : constant := 16#00000004#;  --  /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/stdio.h:45

  -- * Copyright (c) 2013 Apple Inc. All rights reserved.
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

   function renameat
     (arg1 : int;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int;
      arg4 : Interfaces.C.Strings.chars_ptr) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/stdio.h:39
   with Import => True, 
        Convention => C, 
        External_Name => "renameat";

   function renamex_np
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : unsigned) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/stdio.h:46
   with Import => True, 
        Convention => C, 
        External_Name => "renamex_np";

   function renameatx_np
     (arg1 : int;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : unsigned) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/stdio.h:47
   with Import => True, 
        Convention => C, 
        External_Name => "renameatx_np";

end sys_stdio_h;
