class GrBeginPrint
  def initialize(file_name)
    @file_name = file_name
  end

  def call
    GR.beginprint(@file_name)
  end
end

class GrEndPrint
  def call
    GR.endprint()
  end
end

class GrUpdateWs
  def call
    GR.updatews()
  end
end

class GrFillRect
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

class GrSetFillColorInd
  def initialize(color_int)
    @color_int = color_int
  end

  def call
    GR.setfillcolorind(@color_int)
  end
end

class GrSetFillIntStyle
  def initialize(style)
    @style = style
  end

  def call
    GR.setfillintstyle(@style)
  end
end

class GrSetViewPort
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

class GrSetWindow
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

class GrSetMarkerSize
  def initialize(size)
    @size = size
  end

  def call
    GR.setmarkersize(@size)
  end
end

class GrSetMarkerType
  def initialize(type)
    @type = type
  end

  def call
    GR.setmarkertype(@type)
  end
end

class GrSetTextAlign
  def initialize(horizontal, vertical)
    @horizontal = horizontal
    @vertical = vertical
  end

  def call
    GR.settextalign(@horizontal, @vertical)
  end
end

class GrSetTextFontPrec
  def initialize(font, precision)
    @font = font
    @precision = precision
  end

  def call
    GR.settextfontprec(@font, @precision)
  end
end

class GrSetCharHeight
  def initialize(height)
    @height = height
  end

  def call
    GR.setcharheight(@height)
  end
end

class GrAxes
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

class GrText
  def initialize(x_loc, y_loc, text_string)
    @x_loc = x_loc
    @y_loc = y_loc
    @text_string = text_string
  end

  def call
    GR.text(@x_loc, @y_loc, @text_string)
  end
end
