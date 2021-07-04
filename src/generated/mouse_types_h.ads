pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;

package mouse_types_h is

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

  -- mouse data  
  -- absolute position  
  -- movement since last update in pixels  
  -- cell coordinates in the root console  
  -- movement since last update in console cells  
  -- left button status  
  -- right button status  
  -- middle button status  
  -- left button pressed event  
  -- right button pressed event  
  -- middle button pressed event  
  -- wheel up event  
  -- wheel down event  
   type TCOD_mouse_t is record
      x : aliased int;  -- mouse_types.h:38
      y : aliased int;  -- mouse_types.h:38
      dx : aliased int;  -- mouse_types.h:39
      dy : aliased int;  -- mouse_types.h:39
      cx : aliased int;  -- mouse_types.h:40
      cy : aliased int;  -- mouse_types.h:40
      dcx : aliased int;  -- mouse_types.h:41
      dcy : aliased int;  -- mouse_types.h:41
      lbutton : aliased Extensions.bool;  -- mouse_types.h:42
      rbutton : aliased Extensions.bool;  -- mouse_types.h:43
      mbutton : aliased Extensions.bool;  -- mouse_types.h:44
      lbutton_pressed : aliased Extensions.bool;  -- mouse_types.h:45
      rbutton_pressed : aliased Extensions.bool;  -- mouse_types.h:46
      mbutton_pressed : aliased Extensions.bool;  -- mouse_types.h:47
      wheel_up : aliased Extensions.bool;  -- mouse_types.h:48
      wheel_down : aliased Extensions.bool;  -- mouse_types.h:49
   end record
   with Convention => C_Pass_By_Copy;  -- mouse_types.h:50

end mouse_types_h;
