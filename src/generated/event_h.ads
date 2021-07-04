pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with console_types_h;
with sys_h;
limited with mouse_types_h;

package event_h is

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

   type SDL_Event is null record;   -- incomplete struct

  --*
  -- *  Parse an SDL_Event into a key event and return the relevant TCOD_event_t.
  -- *
  -- *  Returns TCOD_EVENT_NONE if the event wasn't keyboard related.
  -- *  \rst
  -- *  .. versionadded:: 1.11
  -- *  \endrst
  --  

  --*
  -- *  Parse an SDL_Event into a mouse event and return the relevant TCOD_event_t.
  -- *
  -- *  Returns TCOD_EVENT_NONE if the event wasn't mouse related.
  -- *  \rst
  -- *  .. versionadded:: 1.11
  -- *  \endrst
  --  

  -- namespace sdl2
  -- namespace tcod
  --*
  -- *  Parse an SDL_Event into a key event and return the relevant TCOD_event_t.
  -- *
  -- *  Returns TCOD_EVENT_NONE if the event wasn't keyboard related.
  -- *  \rst
  -- *  .. versionadded:: 1.11
  -- *  \endrst
  --  

   function TCOD_sys_process_key_event (c_in : access constant SDL_Event; c_out : access console_types_h.TCOD_key_t) return sys_h.TCOD_event_t  -- sdl2/event.h:75
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sys_process_key_event";

  --*
  -- *  Parse an SDL_Event into a mouse event and return the relevant TCOD_event_t.
  -- *
  -- *  Returns TCOD_EVENT_NONE if the event wasn't mouse related.
  -- *  \rst
  -- *  .. versionadded:: 1.11
  -- *  \endrst
  --  

   function TCOD_sys_process_mouse_event (c_in : access constant SDL_Event; c_out : access mouse_types_h.TCOD_mouse_t) return sys_h.TCOD_event_t  -- sdl2/event.h:85
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sys_process_mouse_event";

end event_h;
