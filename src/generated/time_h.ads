pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with sys_utypes_uclock_t_h;
with sys_utypes_utime_t_h;
with sys_utypes_usize_t_h;
limited with sys_utypes_utimespec_h;
with i386_utypes_h;

package time_h is

   CLOCKS_PER_SEC : constant := 1000000;  --  /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:90
   --  unsupported macro: CLOCK_REALTIME _CLOCK_REALTIME
   --  unsupported macro: CLOCK_MONOTONIC _CLOCK_MONOTONIC
   --  unsupported macro: CLOCK_MONOTONIC_RAW _CLOCK_MONOTONIC_RAW
   --  unsupported macro: CLOCK_MONOTONIC_RAW_APPROX _CLOCK_MONOTONIC_RAW_APPROX
   --  unsupported macro: CLOCK_UPTIME_RAW _CLOCK_UPTIME_RAW
   --  unsupported macro: CLOCK_UPTIME_RAW_APPROX _CLOCK_UPTIME_RAW_APPROX
   --  unsupported macro: CLOCK_PROCESS_CPUTIME_ID _CLOCK_PROCESS_CPUTIME_ID
   --  unsupported macro: CLOCK_THREAD_CPUTIME_ID _CLOCK_THREAD_CPUTIME_ID

  -- * Copyright (c) 2000 Apple Computer, Inc. All rights reserved.
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
  -- *	@(#)time.h	8.3 (Berkeley) 1/21/94
  --  

  -- seconds after the minute [0-60]  
   type tm is record
      tm_sec : aliased int;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:76
      tm_min : aliased int;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:77
      tm_hour : aliased int;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:78
      tm_mday : aliased int;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:79
      tm_mon : aliased int;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:80
      tm_year : aliased int;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:81
      tm_wday : aliased int;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:82
      tm_yday : aliased int;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:83
      tm_isdst : aliased int;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:84
      tm_gmtoff : aliased long;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:85
      tm_zone : Interfaces.C.Strings.chars_ptr;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:86
   end record
   with Convention => C_Pass_By_Copy;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:75

  -- minutes after the hour [0-59]  
  -- hours since midnight [0-23]  
  -- day of the month [1-31]  
  -- months since January [0-11]  
  -- years since 1900  
  -- days since Sunday [0-6]  
  -- days since January 1 [0-365]  
  -- Daylight Savings Time flag  
  -- offset from UTC in seconds  
  -- timezone abbreviation  
   tzname : array (size_t) of Interfaces.C.Strings.chars_ptr  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:98
   with Import => True, 
        Convention => C, 
        External_Name => "tzname";

   getdate_err : aliased int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:101
   with Import => True, 
        Convention => C, 
        External_Name => "getdate_err";

   timezone : aliased long  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:103
   with Import => True, 
        Convention => C, 
        External_Name => "_timezone";

   daylight : aliased int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:105
   with Import => True, 
        Convention => C, 
        External_Name => "daylight";

   function asctime (arg1 : access constant tm) return Interfaces.C.Strings.chars_ptr  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:108
   with Import => True, 
        Convention => C, 
        External_Name => "asctime";

   function clock return sys_utypes_uclock_t_h.clock_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:109
   with Import => True, 
        Convention => C, 
        External_Name => "_clock";

   function ctime (arg1 : access sys_utypes_utime_t_h.time_t) return Interfaces.C.Strings.chars_ptr  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:110
   with Import => True, 
        Convention => C, 
        External_Name => "ctime";

   function difftime (arg1 : sys_utypes_utime_t_h.time_t; arg2 : sys_utypes_utime_t_h.time_t) return double  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:111
   with Import => True, 
        Convention => C, 
        External_Name => "difftime";

   function getdate (arg1 : Interfaces.C.Strings.chars_ptr) return access tm  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:112
   with Import => True, 
        Convention => C, 
        External_Name => "getdate";

   function gmtime (arg1 : access sys_utypes_utime_t_h.time_t) return access tm  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:113
   with Import => True, 
        Convention => C, 
        External_Name => "gmtime";

   function localtime (arg1 : access sys_utypes_utime_t_h.time_t) return access tm  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:114
   with Import => True, 
        Convention => C, 
        External_Name => "localtime";

   function mktime (arg1 : access tm) return sys_utypes_utime_t_h.time_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:115
   with Import => True, 
        Convention => C, 
        External_Name => "_mktime";

   function strftime
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : sys_utypes_usize_t_h.size_t;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : access constant tm) return sys_utypes_usize_t_h.size_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:116
   with Import => True, 
        Convention => C, 
        External_Name => "_strftime";

   function strptime
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : access tm) return Interfaces.C.Strings.chars_ptr  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:117
   with Import => True, 
        Convention => C, 
        External_Name => "_strptime";

   function time (arg1 : access sys_utypes_utime_t_h.time_t) return sys_utypes_utime_t_h.time_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:118
   with Import => True, 
        Convention => C, 
        External_Name => "time";

   procedure tzset  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:121
   with Import => True, 
        Convention => C, 
        External_Name => "tzset";

  -- [TSF] Thread safe functions  
   function asctime_r (arg1 : access constant tm; arg2 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:125
   with Import => True, 
        Convention => C, 
        External_Name => "asctime_r";

   function ctime_r (arg1 : access sys_utypes_utime_t_h.time_t; arg2 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:126
   with Import => True, 
        Convention => C, 
        External_Name => "ctime_r";

   function gmtime_r (arg1 : access sys_utypes_utime_t_h.time_t; arg2 : access tm) return access tm  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:127
   with Import => True, 
        Convention => C, 
        External_Name => "gmtime_r";

   function localtime_r (arg1 : access sys_utypes_utime_t_h.time_t; arg2 : access tm) return access tm  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:128
   with Import => True, 
        Convention => C, 
        External_Name => "localtime_r";

   function posix2time (arg1 : sys_utypes_utime_t_h.time_t) return sys_utypes_utime_t_h.time_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:131
   with Import => True, 
        Convention => C, 
        External_Name => "posix2time";

   procedure tzsetwall  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:135
   with Import => True, 
        Convention => C, 
        External_Name => "tzsetwall";

   function time2posix (arg1 : sys_utypes_utime_t_h.time_t) return sys_utypes_utime_t_h.time_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:136
   with Import => True, 
        Convention => C, 
        External_Name => "time2posix";

   function timelocal (arg1 : access tm) return sys_utypes_utime_t_h.time_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:137
   with Import => True, 
        Convention => C, 
        External_Name => "timelocal";

   function timegm (arg1 : access tm) return sys_utypes_utime_t_h.time_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:138
   with Import => True, 
        Convention => C, 
        External_Name => "timegm";

   function nanosleep (uu_rqtp : access constant sys_utypes_utimespec_h.timespec; uu_rmtp : access sys_utypes_utimespec_h.timespec) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:142
   with Import => True, 
        Convention => C, 
        External_Name => "_nanosleep";

   subtype clockid_t is unsigned;
   u_CLOCK_REALTIME : constant unsigned := 0;
   u_CLOCK_MONOTONIC : constant unsigned := 6;
   u_CLOCK_MONOTONIC_RAW : constant unsigned := 4;
   u_CLOCK_MONOTONIC_RAW_APPROX : constant unsigned := 5;
   u_CLOCK_UPTIME_RAW : constant unsigned := 8;
   u_CLOCK_UPTIME_RAW_APPROX : constant unsigned := 9;
   u_CLOCK_PROCESS_CPUTIME_ID : constant unsigned := 12;
   u_CLOCK_THREAD_CPUTIME_ID : constant unsigned := 16;  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:172

   function clock_getres (uu_clock_id : clockid_t; uu_res : access sys_utypes_utimespec_h.timespec) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:175
   with Import => True, 
        Convention => C, 
        External_Name => "clock_getres";

   function clock_gettime (uu_clock_id : clockid_t; uu_tp : access sys_utypes_utimespec_h.timespec) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:178
   with Import => True, 
        Convention => C, 
        External_Name => "clock_gettime";

   function clock_gettime_nsec_np (uu_clock_id : clockid_t) return i386_utypes_h.uu_uint64_t  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:182
   with Import => True, 
        Convention => C, 
        External_Name => "clock_gettime_nsec_np";

   function clock_settime (uu_clock_id : clockid_t; uu_tp : access constant sys_utypes_utimespec_h.timespec) return int  -- /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/time.h:187
   with Import => True, 
        Convention => C, 
        External_Name => "clock_settime";

  -- ISO/IEC 9899:201x 7.27.2.5 The timespec_get function  
end time_h;
