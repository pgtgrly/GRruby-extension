module Rubyplot
  class Figure
    def scatter!(x_coordinates, y_coordinates, marker_size: :default,
                 marker_color: :default, marker_type: :default)
                # give opions for colors as rgb
      @x_range[0] = x_coordinates.min if @x_range[0].nil?
      @x_range[1] = x_coordinates.max if @x_range[1].nil?
      @x_range[0] = x_coordinates.min if x_coordinates.min < @x_range[0]
      @x_range[1] = x_coordinates.max if x_coordinates.max > @x_range[1]

      @y_range[0] = y_coordinates.min if @y_range[0].nil?
      @y_range[1] = y_coordinates.max if @y_range[1].nil?
      @y_range[0] = y_coordinates.min if y_coordinates.min < @y_range[0]
      @y_range[1] = y_coordinates.max if y_coordinates.max > @y_range[1]


      @tasks.push(Scatter.new(x_coordinates, y_coordinates,
                  marker_size: marker_size, marker_color: marker_color,
                  marker_type: marker_type))
    end

    def line!(x_coordinates, y_coordinates, line_width: :default,
              line_color: :default, line_type: :default,
              marker_size: :default, marker_color: :default,
              marker_type: :default)
      @x_range[0] = x_coordinates.min if @x_range[0].nil?
      @x_range[1] = x_coordinates.max if @x_range[1].nil?
      @x_range[0] = x_coordinates.min if x_coordinates.min < @x_range[0]
      @x_range[1] = x_coordinates.max if x_coordinates.max > @x_range[1]

      @y_range[0] = y_coordinates.min if @y_range[0].nil?
      @y_range[1] = y_coordinates.max if @y_range[1].nil?
      @y_range[0] = y_coordinates.min if y_coordinates.min < @y_range[0]
      @y_range[1] = y_coordinates.max if y_coordinates.max > @y_range[1]

      @tasks.push(Line.new(x_coordinates, y_coordinates,
                           line_width: line_width, line_color: line_color,
                           line_type: line_type, marker_size: marker_size,
                           marker_color: marker_color,
                           marker_type: marker_type))
    end

    def bar!(data, bar_color: :default, bar_width: :default,
                   bar_gap: :default, bar_edge: :default, bar_edge_color: :default,
                   bar_edge_width: :default)

      @x_range[0] = 0 if @x_range[0].nil?
      @x_range[1] = data.length if @x_range[0].nil?
      bar_gap = 0 if bar_gap == :default
      bar_width = 1 if bar_width == :default
      bar_edge_width = 0.03 if bar_edge_width == :default
      x_length = data.length * (bar_width + bar_gap) + bar_width + bar_edge_width
      @x_range[1] = x_length if x_length > @x_range[1]

      @y_range[0] = data.min if @y_range[0].nil?
      @y_range[1] = data.max if @y_range[1].nil?
      @y_range[0] = data.min if data.min < @y_range[0]
      @y_range[1] = data.max if data.max > @y_range[1]
      @tasks.push(Bar.new(data, bar_color: bar_color, bar_width: bar_width,
                                bar_gap: bar_gap, bar_edge: bar_edge,
                                bar_edge_color: bar_edge_color,
                                bar_edge_width: bar_edge_width))
    end

    def stacked_bar!(data, bar_colors, bar_width: :default,
                   bar_gap: :default, bar_edge: :default, bar_edge_color: :default,
                   bar_edge_width: :default)

      @x_range[0] = 0 if @x_range[0].nil?
      @x_range[1] = data[0].length if @x_range[1].nil?
      bar_gap = 0 if bar_gap == :default
      bar_width = 1 if bar_width == :default
      bar_edge_width = 0.03 if bar_edge_width == :default
      x_length = data[0].length * (bar_width + bar_gap) + bar_width + bar_edge_width
      @x_range[1] = x_length if x_length > @x_range[1]
      @y_range[0] = data[0].min if @y_range[0].nil?
      @y_range[1] = data[0].max if @y_range[1].nil?
      data.each do |i|
        @y_range[0] = i.min if i.min < @y_range[0]
        @y_range[1] = i.max if i.max > @y_range[1]
      end
      @tasks.push(StackedBar.new(data, bar_colors, bar_width: bar_width,
                                bar_gap: bar_gap, bar_edge: bar_edge,
                                bar_edge_color: bar_edge_color,
                                bar_edge_width: bar_edge_width))
    end

    def candlestick!(open_, high, low, close_, up_color: :default,
                      down_color: :default, bar_width: :default,
                      bar_gap: :default, up_line_color: :default,
                      down_line_color: :default)
      bar_gap = 0 if bar_gap == :default
      bar_width = 1 if bar_width == :default
      @x_range[0] = 0 if @x_range[0].nil?
      x_length = high.length * (bar_width + bar_gap)
      @x_range[1] = x_length if @x_range[1].nil? || x_length > @x_range[1]
      @y_range[0] = low.min if @y_range[0].nil? || low.min < @y_range[0]
      @y_range[1] = high.max if @y_range[1].nil? || high.max > @y_range[1]
      @tasks.push(Candlestick.new(open_, high, low, close_,bar_gap, bar_width,
                                  up_color: up_color, down_color: down_color,
                                  up_line_color: up_line_color,
                                  down_line_color: down_line_color))
    end

    def view
      Rubyplot::Plotspace.new(self).view!
    end

    def save(file_name)
      Rubyplot::Plotspace.new(self).save!(file_name)
    end

  end
end
