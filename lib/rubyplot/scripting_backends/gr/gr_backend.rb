module Rubyplot
  class Figure
    # Plots a scatterplot on the active subplot of the figure
    # @param x_coordinates [Array] A list of x coordinates of points to be plotted
    # @param y_coordinates [Array] A list of y coordinates of points to be plotted
    # @param marker_size [Float] The size of markers
    # @param marker_color [String or Symbol] Color of marker, can be a hex String
    #  (#rrbbgg) or symbol from Rubyplot::Color
    # @param marker_type [Symbol] A symbol for Marker type from
    #  Rubyplot::GRWrapper::Tasks::GR_MARKER_SHAPES
    def scatter!(x_coordinates, y_coordinates, marker_size: :default,
                 marker_color: :default, marker_type: :default)
      @active_subplot.x_range[0] = x_coordinates.min if @active_subplot.x_range[0].nil?
      @active_subplot.x_range[1] = x_coordinates.max if @active_subplot.x_range[1].nil?
      @active_subplot.x_range[0] = x_coordinates.min if x_coordinates.min < @active_subplot.x_range[0]
      @active_subplot.x_range[1] = x_coordinates.max if x_coordinates.max > @active_subplot.x_range[1]

      @active_subplot.y_range[0] = y_coordinates.min if @active_subplot.y_range[0].nil?
      @active_subplot.y_range[1] = y_coordinates.max if @active_subplot.y_range[1].nil?
      @active_subplot.y_range[0] = y_coordinates.min if y_coordinates.min < @active_subplot.y_range[0]
      @active_subplot.y_range[1] = y_coordinates.max if y_coordinates.max > @active_subplot.y_range[1]


      @active_subplot.tasks.push(Scatter.new(x_coordinates, y_coordinates,
                  marker_size: marker_size, marker_color: marker_color,
                  marker_type: marker_type))
    end
    # Plots a linegraph on the active subplot of the figure
    # @param x_coordinates [Array] A list of x coordinates of points to be plotted
    # @param y_coordinates [Array] A list of y coordinates of points to be plotted
    # @param line_width [Float] The width of line
    # @param line_color [String or Symbol] Color of line, can be a hex String
    #  (#rrbbgg) or symbol from Rubyplot::Color
    # @param line_type [Symbol] A symbol for Line type from
    #  Rubyplot::GRWrapper::Tasks::GR_LINE_TYPES
    # @param marker_size [Float] The size of markers
    # @param marker_color [String or Symbol] Color of marker, can be a hex String
    #  (#rrbbgg) or symbol from Rubyplot::Color
    # @param marker_type [Symbol] A symbol for Marker type from
    #  Rubyplot::GRWrapper::Tasks::GR_MARKER_SHAPES
    def line!(x_coordinates, y_coordinates, line_width: :default,
              line_color: :default, line_type: :default,
              marker_size: :default, marker_color: :default,
              marker_type: :default)
      @active_subplot.x_range[0] = x_coordinates.min if @active_subplot.x_range[0].nil?
      @active_subplot.x_range[1] = x_coordinates.max if @active_subplot.x_range[1].nil?
      @active_subplot.x_range[0] = x_coordinates.min if x_coordinates.min < @active_subplot.x_range[0]
      @active_subplot.x_range[1] = x_coordinates.max if x_coordinates.max > @active_subplot.x_range[1]

      @active_subplot.y_range[0] = y_coordinates.min if @active_subplot.y_range[0].nil?
      @active_subplot.y_range[1] = y_coordinates.max if @active_subplot.y_range[1].nil?
      @active_subplot.y_range[0] = y_coordinates.min if y_coordinates.min < @active_subplot.y_range[0]
      @active_subplot.y_range[1] = y_coordinates.max if y_coordinates.max > @active_subplot.y_range[1]

      @active_subplot.tasks.push(Line.new(x_coordinates, y_coordinates,
                           line_width: line_width, line_color: line_color,
                           line_type: line_type, marker_size: marker_size,
                           marker_color: marker_color,
                           marker_type: marker_type))
    end

    # Plots a bar graph
    # @param data [Float Array] Array containing values of bars
    # @param bar_color [String or Symbol] Color of bars, can be a hex String
    #  (#rrbbgg) or symbol from Rubyplot::Color
    # @param bar_width [Float] Width of bar
    # @param bar_gap [Float] Gap between consecutive bars
    # @param bar_edge [Boolean] Argument to draw edge for bar (True by default)
    # @param bar_edge_color [String or Symbol] Color of bar's edge, can be a hex
    #  string (#rrbbgg) or symbol from Rubyplot::Color
    # @param bar_edge_width [Float] Width of bar edge
    def bar!(data, bar_color: :default, bar_width: :default,
                   bar_gap: :default, bar_edge: :default, bar_edge_color: :default,
                   bar_edge_width: :default)

      @active_subplot.x_range[0] = 0 if @active_subplot.x_range[0].nil?
      @active_subplot.x_range[1] = data.length if @active_subplot.x_range[0].nil?
      bar_gap = 0 if bar_gap == :default
      bar_width = 1 if bar_width == :default
      bar_edge_width = 0.03 if bar_edge_width == :default
      x_length = data.length * (bar_width + bar_gap) + bar_width + bar_edge_width
      @active_subplot.x_range[1] = x_length if x_length > @active_subplot.x_range[1]

      @active_subplot.y_range[0] = data.min if @active_subplot.y_range[0].nil?
      @active_subplot.y_range[1] = data.max if @active_subplot.y_range[1].nil?
      @active_subplot.y_range[0] = data.min if data.min < @active_subplot.y_range[0]
      @active_subplot.y_range[1] = data.max if data.max > @active_subplot.y_range[1]
      @active_subplot.tasks.push(Bar.new(data, bar_color: bar_color, bar_width: bar_width,
                                bar_gap: bar_gap, bar_edge: bar_edge,
                                bar_edge_color: bar_edge_color,
                                bar_edge_width: bar_edge_width))
    end

    # Plots a stacked bar graph  in Z axis
    # @param data [Float Array] Array of Arrays containing values of bars
    # @param bar_color [Array of Strings or Array of Symbols] Array containing
    #  color of bars corresponding to eash list in data, an element can be a hex
    #  string(#rrbbgg) or symbol from Rubyplot::Color
    # @param bar_width [Float] Width of bar
    # @param bar_gap [Float] Gap between consecutive bars
    # @param bar_edge [Boolean] Argument to draw edge for bar (True by default)
    # @param bar_edge_color [String or Symbol] Color of bar's edge, can be a hex
    #  string (#rrbbgg) or symbol from Rubyplot::Color
    # @param bar_edge_width [Float] Width of bar edge
    def stacked_bar_z!(data, bar_colors: :default, bar_width: :default,
                   bar_gap: :default, bar_edge: :default, bar_edge_color: :default,
                   bar_edge_width: :default)

      @active_subplot.x_range[0] = 0 if @active_subplot.x_range[0].nil?
      @active_subplot.x_range[1] = data[0].length if @active_subplot.x_range[1].nil?
      bar_gap = 0 if bar_gap == :default
      bar_width = 1 if bar_width == :default
      bar_edge_width = 0.03 if bar_edge_width == :default
      x_length = data[0].length * (bar_width + bar_gap) + bar_width + bar_edge_width
      @active_subplot.x_range[1] = x_length if x_length > @active_subplot.x_range[1]
      @active_subplot.y_range[0] = data[0].min if @active_subplot.y_range[0].nil?
      @active_subplot.y_range[1] = data[0].max if @active_subplot.y_range[1].nil?
      data.each do |i|
        @active_subplot.y_range[0] = i.min if i.min < @active_subplot.y_range[0]
        @active_subplot.y_range[1] = i.max if i.max > @active_subplot.y_range[1]
      end
      @active_subplot.tasks.push(StackedBarZ.new(data,bar_colors: bar_colors, bar_width: bar_width,
                                bar_gap: bar_gap, bar_edge: bar_edge,
                                bar_edge_color: bar_edge_color,
                                bar_edge_width: bar_edge_width))
    end

    # Plots a regular bar graph  in Z axis
    # @param data [Float Array] Array of Arrays containing values of bars
    # @param bar_color [Array of Strings or Array of Symbols] Array containing
    #  color of bars corresponding to eash list in data, an element can be a hex
    #  string(#rrbbgg) or symbol from Rubyplot::Color
    # @param bar_width [Float] Width of bar
    # @param bar_gap [Float] Gap between consecutive bars
    # @param bar_edge [Boolean] Argument to draw edge for bar (True by default)
    # @param bar_edge_color [String or Symbol] Color of bar's edge, can be a hex
    #  string (#rrbbgg) or symbol from Rubyplot::Color
    # @param bar_edge_width [Float] Width of bar edge
    def stacked_bar!(data, bar_colors: :default, bar_width: :default,
                   bar_gap: :default, bar_edge: :default, bar_edge_color: :default,
                   bar_edge_width: :default)
      # Return error if negative data
      @active_subplot.x_range[0] = 0 if @active_subplot.x_range[0].nil?
      @active_subplot.x_range[1] = data[0].length if @active_subplot.x_range[1].nil?
      bar_gap = 0 if bar_gap == :default
      bar_width = 1 if bar_width == :default
      bar_edge_width = 0.03 if bar_edge_width == :default
      x_length = data[0].length * (bar_width + bar_gap) + bar_width + bar_edge_width
      @active_subplot.x_range[1] = x_length if x_length > @active_subplot.x_range[1]
      summed_heights = data.transpose.map { |x| x.reduce(:+) }
      @active_subplot.y_range[0] = 0 if @active_subplot.y_range[0].nil?
      @active_subplot.y_range[1] = summed_heights.max if @active_subplot.y_range[1].nil?
      @active_subplot.y_range[1] = summed_heights.max if summed_heights.max > @active_subplot.y_range[1]
      @active_subplot.tasks.push(StackedBar.new(data,bar_colors: bar_colors, bar_width: bar_width,
                                bar_gap: bar_gap, bar_edge: bar_edge,
                                bar_edge_color: bar_edge_color,
                                bar_edge_width: bar_edge_width))
    end

    # Plots a candlestick graph
    # @param open_ [Float Array] Array containing the opening values of a period
    # @param high [Float Array] Array containing the highest value of a period
    # @param low [Float Array] Array containing the lowest value of a period
    # @param close_ [Float Array] Array containing the closing values of a period
    # @param up_color [String or Symbol] Color of candle when close > open, can
    #  be a hex string (#rrbbgg) or symbol from Rubyplot::Color
    # @param down_color [String or Symbol] Color of candle when close < open, can
    #  be a hex string (#rrbbgg) or symbol from Rubyplot::Color
    # @param bar_width [Float] Width of candle
    # @param bar_gap [Float] Gap between consecutive candles
    # @param up_line_color [String or Symbol] Color of line when close > open, can
    #  be a hex string (#rrbbgg) or symbol from Rubyplot::Color
    # @param down_line_color [String or Symbol] Color of line when close < open, can
    #  be a hex string (#rrbbgg) or symbol from Rubyplot::Color

    def candlestick!(open_, high, low, close_, up_color: :default,
                      down_color: :default, bar_width: :default,
                      bar_gap: :default, up_line_color: :default,
                      down_line_color: :default)
      bar_gap = 0 if bar_gap == :default
      bar_width = 1 if bar_width == :default
      @active_subplot.x_range[0] = 0 if @x_range[0].nil?
      x_length = high.length * (bar_width + bar_gap)
      @active_subplot.x_range[1] = x_length if @active_subplot.x_range[1].nil? || x_length > @active_subplot.x_range[1]
      @active_subplot.y_range[0] = low.min if @active_subplot.y_range[0].nil? || low.min < @active_subplot.y_range[0]
      @active_subplot.y_range[1] = high.max if @active_subplot.y_range[1].nil? || high.max > @active_subplot.y_range[1]
      @active_subplot.tasks.push(Candlestick.new(open_, high, low, close_,bar_gap, bar_width,
                                  up_color: up_color, down_color: down_color,
                                  up_line_color: up_line_color,
                                  down_line_color: down_line_color))
    end

    # To view the Figure
    def view
      Rubyplot::Plotspace.new(self).view!
    end

    # To save the figure, currently only as .BMP files
    # known bug : save is not gvivng same output as view,in some cases
    #  this is an internal error in  GR Framework
    # @param file_name [String] name of the file where the figure needs to be saved
    def save(file_name)
      Rubyplot::Plotspace.new(self).save!(file_name)
    end

  end
end
