module Rubyplot
  module GRWrapper
    module Tasks
      class BeginPrint
        attr_reader :file_name

        def initialize(file_name)
          @file_name = file_name
        end

        def call
          GR.beginprint(@file_name)
        end
      end

      class EndPrint
        def call
          GR.endprint
        end
      end

      class UpdateWs
        def call
          GR.updatews
        end
      end

      class Polymarker
        def initialize(x_coordinates, y_coordinates)
          @x_coordinates = x_coordinates
          @y_coordinates = y_coordinates
        end
        def call
          GR.polymarker(@x_coordinates, @y_coordinates)
        end
      end

      class Polyline
        def initialize(x_coordinates, y_coordinates)
          @x_coordinates = x_coordinates
          @y_coordinates = y_coordinates
        end
        def call
          GR.polyline(@x_coordinates, @y_coordinates)
        end
      end

      class FillRect
        def initialize(x_min, x_max, y_min, y_max)
          @x_min = x_min
          @x_max = x_max
          @y_min = y_min
          @y_max = y_max
        end

        def call
          GR.fillrect(@x_min, @x_max, @y_min, @y_max)
        end
      end

      class SetFillColorIndex
        def initialize(color_int)
          @color_int = color_int
        end

        def call
          GR.setfillcolorind(@color_int)
        end
      end

      class SetFillIntStyle
        def initialize(style)
          @style = style
        end

        def call
          GR.setfillintstyle(@style)
        end
      end

      class SetViewPort
        def initialize(x_min, x_max, y_min, y_max)
          @x_min = x_min
          @x_max = x_max
          @y_min = y_min
          @y_max = y_max
        end

        def call
          GR.setviewport(@x_min, @x_max, @y_min, @y_max)
        end
      end

      class SetWindow
        def initialize(x_min, x_max, y_min, y_max)
          @x_min = x_min
          @x_max = x_max
          @y_min = y_min
          @y_max = y_max
        end

        def call
          GR.setwindow(@x_min, @x_max, @y_min, @y_max)
        end
      end

      class SetMarkerSize
        def initialize(size)
          @size = size
        end

        def call
          GR.setmarkersize(@size)
        end
      end

      class SetMarkerType
        def initialize(type)
          @type = type
        end

        def call
          GR.setmarkertype(@type)
        end
      end

      class SetMarkerColorIndex
        def initialize(index)
          @index = index
        end

        def call
          GR.setmarkercolorind(@index)
        end
      end

      class SetTextAlign
        def initialize(horizontal, vertical)
          @horizontal = horizontal
          @vertical = vertical
        end

        def call
          GR.settextalign(@horizontal, @vertical)
        end
      end

      class SetTextFontPrec
        def initialize(font, precision)
          @font = font
          @precision = precision
        end

        def call
          GR.settextfontprec(@font, @precision)
        end
      end

      class SetCharHeight
        def initialize(height)
          @height = height
        end

        def call
          GR.setcharheight(@height)
        end
      end

      class Axes
        def initialize(x_major_tick, y_major_tick, x_origin, y_origin, major_x,
                       major_y, tick_size)
          @x_major_tick = x_major_tick
          @y_major_tick = y_major_tick
          @x_origin = x_origin
          @y_origin = y_origin
          @major_x = major_x
          @major_y = major_y
          @tick_size = tick_size
        end

        def call
          GR.axes(@x_major_tick, @y_major_tick, @x_origin, @y_origin, @major_x,
                  @major_y, @tick_size)
        end
      end

      class Grid
        def initialize(x_major_tick, y_major_tick, x_origin, y_origin, major_x,
                       major_y)
          @x_major_tick = x_major_tick
          @y_major_tick = y_major_tick
          @x_origin = x_origin
          @y_origin = y_origin
          @major_x = major_x
          @major_y = major_y
        end

        def call
          GR.grid(@x_major_tick, @y_major_tick, @x_origin, @y_origin, @major_x,
                  @major_y)
        end
      end

      class Text
        def initialize(x_loc, y_loc, text_string)
          @x_loc = x_loc
          @y_loc = y_loc
          @text_string = text_string
        end

        def call
          GR.text(@x_loc, @y_loc, @text_string)
        end
      end

      # Will define color index, fonts, marker types and other constants
      # color index between 1 to 1256. map all prominent ones here
      BLACK = 1
      GREEN = 900

      #Marker types
      DOT = 1
      PLUS = 2
      ASTERISK = 3
      CIRCLE = 4
      DIAGONAL_CROSS = 5
      SOLID_CIRCLE = -1
      TRIANGLE_UP = -2
      SOLID_TRI_UP = -3
      TRIANGLE_DOWN  = -4
      SOLID_TRI_DOWN = -5
      SQUARE = -6
      SOLID_SQUARE = -7
      BOWTIE = -8
      SOLID_BOWTIE = -9
      HGLASS = -10
      SOLID_HGLASS = -11
      DIAMOND = -12
      SOLID_DIAMOND = -13
      STAR = -14
      SOLID_STAR = -15
      TRI_UP_DOWN = -16
      SOLID_TRI_RIGHT = -17
      SOLID_TRI_LEFT = -18
      HOLLOW_PLUS = -19
      SOLID_PLUS = -20
      PENTAGON = -21
      HEXAGON = -22
      HEPTAGON = -23
      OCTAGON = -24
      STAR_4 = -25
      STAR_5 = -26
      STAR_6 = -27
      STAR_7 = -28
      STAR_8 = -29
      VLINE = -30
      HLINE = -31
      OMARK = -32
    end
  end
end
