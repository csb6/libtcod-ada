pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;

package sys_upthread_upthread_types_h is

  -- * Copyright (c) 2003-2013 Apple Inc. All rights reserved.
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

  -- pthread opaque structures
  -- Routine to call
   type uu_darwin_pthread_handler_rec;
   type uu_darwin_pthread_handler_rec is record
      uu_routine : access procedure (arg1 : System.Address);  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:58
      uu_arg : System.Address;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:59
      uu_next : access uu_darwin_pthread_handler_rec;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:60
   end record
   with Convention => C_Pass_By_Copy;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:57

  -- Argument to pass
   subtype anon820_array822 is Interfaces.C.char_array (0 .. 55);
   type u_opaque_pthread_attr_t is record
      uu_sig : aliased long;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:64
      uu_opaque : aliased anon820_array822;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:65
   end record
   with Convention => C_Pass_By_Copy;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:63

   subtype anon823_array825 is Interfaces.C.char_array (0 .. 39);
   type u_opaque_pthread_cond_t is record
      uu_sig : aliased long;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:69
      uu_opaque : aliased anon823_array825;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:70
   end record
   with Convention => C_Pass_By_Copy;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:68

   subtype anon826_array828 is Interfaces.C.char_array (0 .. 7);
   type u_opaque_pthread_condattr_t is record
      uu_sig : aliased long;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:74
      uu_opaque : aliased anon826_array828;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:75
   end record
   with Convention => C_Pass_By_Copy;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:73

   subtype anon829_array822 is Interfaces.C.char_array (0 .. 55);
   type u_opaque_pthread_mutex_t is record
      uu_sig : aliased long;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:79
      uu_opaque : aliased anon829_array822;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:80
   end record
   with Convention => C_Pass_By_Copy;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:78

   subtype anon830_array828 is Interfaces.C.char_array (0 .. 7);
   type u_opaque_pthread_mutexattr_t is record
      uu_sig : aliased long;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:84
      uu_opaque : aliased anon830_array828;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:85
   end record
   with Convention => C_Pass_By_Copy;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:83

   subtype anon831_array828 is Interfaces.C.char_array (0 .. 7);
   type u_opaque_pthread_once_t is record
      uu_sig : aliased long;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:89
      uu_opaque : aliased anon831_array828;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:90
   end record
   with Convention => C_Pass_By_Copy;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:88

   subtype anon832_array834 is Interfaces.C.char_array (0 .. 191);
   type u_opaque_pthread_rwlock_t is record
      uu_sig : aliased long;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:94
      uu_opaque : aliased anon832_array834;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:95
   end record
   with Convention => C_Pass_By_Copy;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:93

   subtype anon835_array836 is Interfaces.C.char_array (0 .. 15);
   type u_opaque_pthread_rwlockattr_t is record
      uu_sig : aliased long;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:99
      uu_opaque : aliased anon835_array836;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:100
   end record
   with Convention => C_Pass_By_Copy;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:98

   subtype anon837_array839 is Interfaces.C.char_array (0 .. 8175);
   type u_opaque_pthread_t is record
      uu_sig : aliased long;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:104
      uu_cleanup_stack : access uu_darwin_pthread_handler_rec;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:105
      uu_opaque : aliased anon837_array839;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:106
   end record
   with Convention => C_Pass_By_Copy;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:103

   subtype uu_darwin_pthread_attr_t is u_opaque_pthread_attr_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:109

   subtype uu_darwin_pthread_cond_t is u_opaque_pthread_cond_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:110

   subtype uu_darwin_pthread_condattr_t is u_opaque_pthread_condattr_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:111

   subtype uu_darwin_pthread_key_t is unsigned_long;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:112

   subtype uu_darwin_pthread_mutex_t is u_opaque_pthread_mutex_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:113

   subtype uu_darwin_pthread_mutexattr_t is u_opaque_pthread_mutexattr_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:114

   subtype uu_darwin_pthread_once_t is u_opaque_pthread_once_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:115

   subtype uu_darwin_pthread_rwlock_t is u_opaque_pthread_rwlock_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:116

   subtype uu_darwin_pthread_rwlockattr_t is u_opaque_pthread_rwlockattr_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:117

   type uu_darwin_pthread_t is access all u_opaque_pthread_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:118

end sys_upthread_upthread_types_h;
