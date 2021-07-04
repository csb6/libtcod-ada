pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Strings;
with Interfaces.C.Extensions;
with list_h;
with sys_utypes_usize_t_h;
with utypes_uuint32_t_h;
with console_types_h;
with error_h;
with image_h;
limited with context_h;
limited with mouse_types_h;

package sys_h is

  -- BSD 3-Clause License
  -- *
  -- * Copyright © 2008-2021, Jice and the libtcod contributors.
  -- * All rights reserved.
  -- *
  -- * Redistribution and use in source and binary forms, with or without
  -- * modification, are permitted provided that the following conditions are met:
  -- *
  -- * 1. Redistributions of source code must retain the above copyright notice,
  -- *    this list of conditions and the following disclaimer.
  -- *
  -- * 2. Redistributions in binary form must reproduce the above copyright notice,
  -- *    this list of conditions and the following disclaimer in the documentation
  -- *    and/or other materials provided with the distribution.
  -- *
  -- * 3. Neither the name of the copyright holder nor the names of its
  -- *    contributors may be used to endorse or promote products derived from
  -- *    this software without specific prior written permission.
  -- *
  -- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  -- * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  -- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
  -- * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
  -- * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
  -- * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
  -- * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
  -- * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
  -- * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
  -- * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
  -- * POSSIBILITY OF SUCH DAMAGE.
  --  

  -- #ifdef TCOD_TOUCH_INPUT  
  -- #endif  
   subtype TCOD_event_t is unsigned;
   TCOD_EVENT_NONE : constant unsigned := 0;
   TCOD_EVENT_KEY_PRESS : constant unsigned := 1;
   TCOD_EVENT_KEY_RELEASE : constant unsigned := 2;
   TCOD_EVENT_KEY : constant unsigned := 3;
   TCOD_EVENT_MOUSE_MOVE : constant unsigned := 4;
   TCOD_EVENT_MOUSE_PRESS : constant unsigned := 8;
   TCOD_EVENT_MOUSE_RELEASE : constant unsigned := 16;
   TCOD_EVENT_MOUSE : constant unsigned := 28;
   TCOD_EVENT_FINGER_MOVE : constant unsigned := 32;
   TCOD_EVENT_FINGER_PRESS : constant unsigned := 64;
   TCOD_EVENT_FINGER_RELEASE : constant unsigned := 128;
   TCOD_EVENT_FINGER : constant unsigned := 224;
   TCOD_EVENT_ANY : constant unsigned := 255;  -- sdl2/../sys.h:56

   type SDL_Surface is null record;   -- incomplete struct

   type SDL_renderer_t is access procedure (arg1 : access SDL_Surface)
   with Convention => C;  -- sdl2/../sys.h:59

  -- thread stuff  
   type TCOD_thread_t is new System.Address;  -- sdl2/../sys.h:62

   type TCOD_semaphore_t is new System.Address;  -- sdl2/../sys.h:63

   type TCOD_mutex_t is new System.Address;  -- sdl2/../sys.h:64

   type TCOD_cond_t is new System.Address;  -- sdl2/../sys.h:65

   procedure TCOD_sys_startup  -- sdl2/../sys.h:70
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sys_startup";

   procedure TCOD_sys_shutdown  -- sdl2/../sys.h:71
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sys_shutdown";

  -- filesystem stuff  
   function TCOD_sys_create_directory (path : Interfaces.C.Strings.chars_ptr) return Extensions.bool  -- sdl2/../sys.h:75
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sys_create_directory";

   function TCOD_sys_delete_file (path : Interfaces.C.Strings.chars_ptr) return Extensions.bool  -- sdl2/../sys.h:77
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sys_delete_file";

   function TCOD_sys_delete_directory (path : Interfaces.C.Strings.chars_ptr) return Extensions.bool  -- sdl2/../sys.h:79
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sys_delete_directory";

   function TCOD_sys_is_directory (path : Interfaces.C.Strings.chars_ptr) return Extensions.bool  -- sdl2/../sys.h:81
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sys_is_directory";

   function TCOD_sys_get_directory_content (path : Interfaces.C.Strings.chars_ptr; pattern : Interfaces.C.Strings.chars_ptr) return list_h.TCOD_list_t  -- sdl2/../sys.h:83
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sys_get_directory_content";

   function TCOD_sys_file_exists (filename : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return Extensions.bool  -- sdl2/../sys.h:85
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sys_file_exists";

   function TCOD_sys_read_file
     (filename : Interfaces.C.Strings.chars_ptr;
      buf : System.Address;
      size : access sys_utypes_usize_t_h.size_t) return Extensions.bool  -- sdl2/../sys.h:87
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sys_read_file";

   function TCOD_sys_write_file
     (filename : Interfaces.C.Strings.chars_ptr;
      buf : access unsigned_char;
      size : utypes_uuint32_t_h.uint32_t) return Extensions.bool  -- sdl2/../sys.h:89
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sys_write_file";

  -- threads  
   function TCOD_thread_new (func : access function (arg1 : System.Address) return int; data : System.Address) return TCOD_thread_t  -- sdl2/../sys.h:92
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_thread_new";

   procedure TCOD_thread_delete (th : TCOD_thread_t)  -- sdl2/../sys.h:94
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_thread_delete";

   function TCOD_sys_get_num_cores return int  -- sdl2/../sys.h:96
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sys_get_num_cores";

   procedure TCOD_thread_wait (th : TCOD_thread_t)  -- sdl2/../sys.h:98
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_thread_wait";

  -- mutex  
   function TCOD_mutex_new return TCOD_mutex_t  -- sdl2/../sys.h:101
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_mutex_new";

   procedure TCOD_mutex_in (mut : TCOD_mutex_t)  -- sdl2/../sys.h:103
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_mutex_in";

   procedure TCOD_mutex_out (mut : TCOD_mutex_t)  -- sdl2/../sys.h:105
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_mutex_out";

   procedure TCOD_mutex_delete (mut : TCOD_mutex_t)  -- sdl2/../sys.h:107
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_mutex_delete";

  -- semaphore  
   function TCOD_semaphore_new (initVal : int) return TCOD_semaphore_t  -- sdl2/../sys.h:110
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_semaphore_new";

   procedure TCOD_semaphore_lock (sem : TCOD_semaphore_t)  -- sdl2/../sys.h:112
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_semaphore_lock";

   procedure TCOD_semaphore_unlock (sem : TCOD_semaphore_t)  -- sdl2/../sys.h:114
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_semaphore_unlock";

   procedure TCOD_semaphore_delete (sem : TCOD_semaphore_t)  -- sdl2/../sys.h:116
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_semaphore_delete";

  -- condition  
   function TCOD_condition_new return TCOD_cond_t  -- sdl2/../sys.h:119
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_condition_new";

   procedure TCOD_condition_signal (sem : TCOD_cond_t)  -- sdl2/../sys.h:121
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_condition_signal";

   procedure TCOD_condition_broadcast (sem : TCOD_cond_t)  -- sdl2/../sys.h:123
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_condition_broadcast";

   procedure TCOD_condition_wait (sem : TCOD_cond_t; mut : TCOD_mutex_t)  -- sdl2/../sys.h:125
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_condition_wait";

   procedure TCOD_condition_delete (sem : TCOD_cond_t)  -- sdl2/../sys.h:127
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_condition_delete";

  -- dynamic library  
   type TCOD_library_t is new System.Address;  -- sdl2/../sys.h:129

   function TCOD_load_library (path : Interfaces.C.Strings.chars_ptr) return TCOD_library_t  -- sdl2/../sys.h:131
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_load_library";

   function TCOD_get_function_address (arg1 : TCOD_library_t; arg2 : Interfaces.C.Strings.chars_ptr) return System.Address  -- sdl2/../sys.h:133
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_get_function_address";

   procedure TCOD_close_library (arg1 : TCOD_library_t)  -- sdl2/../sys.h:135
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_close_library";

   function TCOD_sys_elapsed_milli return utypes_uuint32_t_h.uint32_t  -- sdl2/../sys.h:138
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sys_elapsed_milli";

   function TCOD_sys_elapsed_seconds return float  -- sdl2/../sys.h:139
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sys_elapsed_seconds";

   procedure TCOD_sys_sleep_milli (val : utypes_uuint32_t_h.uint32_t)  -- sdl2/../sys.h:140
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sys_sleep_milli";

   procedure TCOD_sys_set_fps (val : int)  -- sdl2/../sys.h:141
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sys_set_fps";

   function TCOD_sys_get_fps return int  -- sdl2/../sys.h:142
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sys_get_fps";

   function TCOD_sys_get_last_frame_length return float  -- sdl2/../sys.h:143
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sys_get_last_frame_length";

   procedure TCOD_sys_save_screenshot (filename : Interfaces.C.Strings.chars_ptr)  -- sdl2/../sys.h:145
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sys_save_screenshot";

   procedure TCOD_sys_force_fullscreen_resolution (width : int; height : int)  -- sdl2/../sys.h:146
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sys_force_fullscreen_resolution";

   function TCOD_sys_set_renderer (renderer : console_types_h.TCOD_renderer_t) return int  -- sdl2/../sys.h:147
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sys_set_renderer";

   function TCOD_sys_get_renderer return console_types_h.TCOD_renderer_t  -- sdl2/../sys.h:148
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sys_get_renderer";

  --*
  --    Return the resolution of the current monitor.
  --  

   function TCOD_sys_get_current_resolution (w : access int; h : access int) return error_h.TCOD_Error  -- sdl2/../sys.h:153
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sys_get_current_resolution";

   procedure TCOD_sys_get_fullscreen_offsets (offset_x : access int; offset_y : access int)  -- sdl2/../sys.h:154
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sys_get_fullscreen_offsets";

   procedure TCOD_sys_get_char_size (w : access int; h : access int)  -- sdl2/../sys.h:155
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sys_get_char_size";

  --*
  -- *  Upload a tile to the active tileset.
  -- *
  -- *  `asciiCode` is the Unicode codepoint for this tile.
  -- *
  -- *  `font_x` and `font_y` are the tile-coordinates on the active tilemap.
  -- *
  -- *  `img` is the tile to upload.
  -- *
  -- *  `x` and `y` are the upper-left pixel-coordinates of the tile on the `img`.
  --  

   procedure TCOD_sys_update_char
     (asciiCode : int;
      font_x : int;
      font_y : int;
      img : image_h.TCOD_image_t;
      x : int;
      y : int)  -- sdl2/../sys.h:168
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sys_update_char";

   function TCOD_sys_get_SDL_window return access context_h.SDL_Window  -- sdl2/../sys.h:170
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sys_get_SDL_window";

   function TCOD_sys_get_SDL_renderer return access context_h.SDL_Renderer  -- sdl2/../sys.h:171
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sys_get_SDL_renderer";

   function TCOD_sys_wait_for_event
     (eventMask : int;
      key : access console_types_h.TCOD_key_t;
      mouse : access mouse_types_h.TCOD_mouse_t;
      flush : Extensions.bool) return TCOD_event_t  -- sdl2/../sys.h:174
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sys_wait_for_event";

   function TCOD_sys_check_for_event
     (eventMask : int;
      key : access console_types_h.TCOD_key_t;
      mouse : access mouse_types_h.TCOD_mouse_t) return TCOD_event_t  -- sdl2/../sys.h:176
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sys_check_for_event";

  -- clipboard  
   function TCOD_sys_clipboard_set (value : Interfaces.C.Strings.chars_ptr) return Extensions.bool  -- sdl2/../sys.h:180
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sys_clipboard_set";

   function TCOD_sys_clipboard_get return Interfaces.C.Strings.chars_ptr  -- sdl2/../sys.h:182
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sys_clipboard_get";

  -- SDL renderer callback  
   procedure TCOD_sys_register_SDL_renderer (renderer : SDL_renderer_t)  -- sdl2/../sys.h:186
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sys_register_SDL_renderer";

  -- extern "C"
end sys_h;
