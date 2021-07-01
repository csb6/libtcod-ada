pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with sys_utypes_uint64_t_h;
with sys_utypes_uu_int64_t_h;

package i386_types_h is

   --  unsupported macro: USER_ADDR_NULL ((user_addr_t) 0)
   --  arg-macro: function CAST_USER_ADDR_T (a_ptr)
   --    return (user_addr_t)((uintptr_t)(a_ptr));
  -- * Copyright (c) 2000-2008 Apple Inc. All rights reserved.
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

  -- * Copyright 1995 NeXT Computer, Inc. All rights reserved.
  --  

  -- * Copyright (c) 1990, 1993
  -- *	The Regents of the University of California.  All rights reserved.
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
  -- *	@(#)types.h	8.3 (Berkeley) 1/5/94
  --  

  -- * Basic integral types.  Omit the typedef if
  -- * not possible for a machine/compiler combination.
  --  

   subtype register_t is sys_utypes_uint64_t_h.int64_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/i386/types.h:87

  -- These types are used for reserving the largest possible size.  
   subtype user_addr_t is sys_utypes_uu_int64_t_h.u_int64_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/i386/types.h:97

   subtype user_size_t is sys_utypes_uu_int64_t_h.u_int64_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/i386/types.h:98

   subtype user_ssize_t is sys_utypes_uint64_t_h.int64_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/i386/types.h:99

   subtype user_long_t is sys_utypes_uint64_t_h.int64_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/i386/types.h:100

   subtype user_ulong_t is sys_utypes_uu_int64_t_h.u_int64_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/i386/types.h:101

   subtype user_time_t is sys_utypes_uint64_t_h.int64_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/i386/types.h:102

   subtype user_off_t is sys_utypes_uint64_t_h.int64_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/i386/types.h:103

  -- This defines the size of syscall arguments after copying into the kernel:  
   subtype syscall_arg_t is sys_utypes_uu_int64_t_h.u_int64_t;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/i386/types.h:111

end i386_types_h;
