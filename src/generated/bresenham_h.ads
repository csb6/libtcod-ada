pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;

package bresenham_h is

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

  --*
  -- *  \brief A callback to be passed to TCOD_line
  -- *
  -- *  The points given to the callback include both the starting and ending
  -- *  positions.
  -- *
  -- *  \param x
  -- *  \param y
  -- *  \return As long as this callback returns true it will be called with the
  -- *          next x,y point on the line.
  --  

   type TCOD_line_listener_t is access function (arg1 : int; arg2 : int) return Extensions.bool
   with Convention => C;  -- bresenham.h:58

   procedure TCOD_line_init
     (xFrom : int;
      yFrom : int;
      xTo : int;
      yTo : int)  -- bresenham.h:60
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_line_init";

  --* advance one step. returns true if we reach destination  
   function TCOD_line_step (xCur : access int; yCur : access int) return Extensions.bool  -- bresenham.h:64
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_line_step";

  -- atomic callback function. Stops when the callback returns false  
   function TCOD_line
     (xFrom : int;
      yFrom : int;
      xTo : int;
      yTo : int;
      listener : TCOD_line_listener_t) return Extensions.bool  -- bresenham.h:68
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_line";

  --*
  -- *  \brief A struct used for computing a bresenham line.
  --  

   type TCOD_bresenham_data_t is record
      stepx : aliased int;  -- bresenham.h:73
      stepy : aliased int;  -- bresenham.h:74
      e : aliased int;  -- bresenham.h:75
      deltax : aliased int;  -- bresenham.h:76
      deltay : aliased int;  -- bresenham.h:77
      origx : aliased int;  -- bresenham.h:78
      origy : aliased int;  -- bresenham.h:79
      destx : aliased int;  -- bresenham.h:80
      desty : aliased int;  -- bresenham.h:81
   end record
   with Convention => C_Pass_By_Copy;  -- bresenham.h:82

   procedure TCOD_line_init_mt
     (xFrom : int;
      yFrom : int;
      xTo : int;
      yTo : int;
      data : access TCOD_bresenham_data_t)  -- bresenham.h:84
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_line_init_mt";

   function TCOD_line_step_mt
     (xCur : access int;
      yCur : access int;
      data : access TCOD_bresenham_data_t) return Extensions.bool  -- bresenham.h:85
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_line_step_mt";

   function TCOD_line_mt
     (xFrom : int;
      yFrom : int;
      xTo : int;
      yTo : int;
      listener : TCOD_line_listener_t;
      data : access TCOD_bresenham_data_t) return Extensions.bool  -- bresenham.h:88
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_line_mt";

  -- extern "C"
  --*
  --    Encapsulates a Bresenham line drawing algorithm.
  --    \rst
  --    .. versionadded:: 1.17
  --    \endrst
  --  

  --*
  --      Construct a new Bresenham line from `begin` to `end`.
  --      Iterating over this instance will include both endpoints.
  --    

  --*
  --      Construct a new Bresenham line with a manually given error value.
  --    

  --*
  --      Return the world position of the Bresenham at the index relative to the current index.
  --      BresenhamLine is not restricted by any bounds so you can freely give a index past the end or before zero.
  --      The internal state must always seek to the position being indexed, this will affect performance depending on if
  --      successive indexes are close together or far apart.
  --    

  --*
  --      Return the world position of the Bresenham at the current index.
  --    

  --*
  --      Return a new version of this BresenhamLine with an adjusted range.
  --      `shift_begin` and `shift_end` change the beginning and ending of the line
  --      when iterators over.
  --      Example::
  --        // Remove the endpoints of a bresenham line.
  --        auto line = tcod::BresenhamLine(from, to).adjust_range(1, -1);
  --    

  --*
  --      Remove the staring endpoint of a line.
  --      Example::
  --        for (auto&& [x, y] : tcod::BresenhamLine(from, to).without_start()) {
  --          // All positions excluding `from`.
  --        }
  --    

  --*
  --      Remove the final endpoint of a line.
  --      Example::
  --        for (auto&& [x, y] : tcod::BresenhamLine(from, to).without_end()) {
  --          // All positions excluding `to`.
  --        }
  --    

  --*
  --      Remove both endpoints of a line.
  --      Example::
  --        for (auto&& [x, y] : tcod::BresenhamLine(from, to).without_endpoints()) {
  --          // All positions between and excluding `from` and `to`.
  --        }
  --    

  --*
  --      Return the beginning iterator, which is a copy of the current object.
  --    

  --*
  --      Return the past-the-end iterator.
  --    

  --*
  --      Transform matrix to convert from normalized state cursor to the real world coordinates.
  --    

  --*
  --        Convert a state cursor vector to the a world vector.
  --      

  -- Affine transformation on X.
  -- Affine transformation on Y.
  -- Index to world X.
  -- Index to world Y.
  -- Cursor Y to world X.
  -- Cursor Y to world Y.
  --*
  --      Return a Matrix that converts a normalized cursor to the correct octant.
  --    

  --*
  --      Return the normalized delta vector.
  --      The first axis is always the longest. All values are non-negative.
  --    

  --*
  --      Return the normalized delta X value.
  --      This is the value of the longest delta axis as a positive integer and is often used to determine the line length.
  --    

  --*
  --      Advance one step using the Bresenham algorithm.
  --    

  --*
  --      Inverse Bresenham algorithm.  Takes one step backwards.
  --    

  --*
  --      Seek to the given index and return the world position of the cursor.
  --    

  -- Starting point.
  -- Ending point.
  -- The starting index returned by `begin`.
  -- The past-the-end index returned by `end`.
  -- Normalized Bresenham low-slope position.  First axis acts as the current index.
  -- Fractional difference between Y indexes.  Is always `-delta[0] < err <= 0`.
  -- namespace tcod
end bresenham_h;
