pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with i386_utypes_h;

package sys_utypes_h is

  -- * Copyright (c) 2003-2007 Apple Inc. All rights reserved.
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

  -- * Type definitions; takes common type definitions that must be used
  -- * in multiple header files due to [XSI], removes them from the system
  -- * space, and puts them in the implementation space.
  --  

  -- total blocks  
   subtype uu_darwin_blkcnt_t is i386_utypes_h.uu_int64_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types.h:55

  -- preferred block size  
   subtype uu_darwin_blksize_t is i386_utypes_h.uu_int32_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types.h:56

  -- dev_t  
   subtype uu_darwin_dev_t is i386_utypes_h.uu_int32_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types.h:57

  -- Used by statvfs and fstatvfs  
   subtype uu_darwin_fsblkcnt_t is unsigned;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types.h:58

  -- Used by statvfs and fstatvfs  
   subtype uu_darwin_fsfilcnt_t is unsigned;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types.h:59

  -- [???] process and group IDs  
   subtype uu_darwin_gid_t is i386_utypes_h.uu_uint32_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types.h:60

  -- [XSI] pid_t, uid_t, or gid_t 
   subtype uu_darwin_id_t is i386_utypes_h.uu_uint32_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types.h:61

  -- [???] Used for 64 bit inodes  
   subtype uu_darwin_ino64_t is i386_utypes_h.uu_uint64_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types.h:62

  -- [???] Used for inodes  
   subtype uu_darwin_ino_t is uu_darwin_ino64_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types.h:64

  -- [???] Used for inodes  
  -- Used by mach  
   subtype uu_darwin_mach_port_name_t is i386_utypes_h.uu_darwin_natural_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types.h:68

  -- Used by mach  
   subtype uu_darwin_mach_port_t is uu_darwin_mach_port_name_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types.h:69

  -- [???] Some file attributes  
   subtype uu_darwin_mode_t is i386_utypes_h.uu_uint16_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types.h:70

  -- [???] Used for file sizes  
   subtype uu_darwin_off_t is i386_utypes_h.uu_int64_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types.h:71

  -- [???] process and group IDs  
   subtype uu_darwin_pid_t is i386_utypes_h.uu_int32_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types.h:72

  -- [???] signal set  
   subtype uu_darwin_sigset_t is i386_utypes_h.uu_uint32_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types.h:73

  -- [???] microseconds  
   subtype uu_darwin_suseconds_t is i386_utypes_h.uu_int32_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types.h:74

  -- [???] user IDs  
   subtype uu_darwin_uid_t is i386_utypes_h.uu_uint32_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types.h:75

  -- [???] microseconds  
   subtype uu_darwin_useconds_t is i386_utypes_h.uu_uint32_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types.h:76

   type uu_darwin_uuid_t is array (0 .. 15) of aliased unsigned_char;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types.h:77

   subtype uu_darwin_uuid_string_t is Interfaces.C.char_array (0 .. 36);  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types.h:78

end sys_utypes_h;
