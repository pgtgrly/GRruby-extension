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
      @x_range[1] = data.length if data.length > @x_range[1]

      @y_range[0] = data.min if @y_range[0].nil?
      @y_range[1] = data.max if @y_range[1].nil?
      @y_range[0] = data.min if data.min < @y_range[0]
      @y_range[1] = data.max if data.max > @y_range[1]
      @tasks.push(Bar.new(data, bar_color: bar_color, bar_width: bar_width,
                         bar_gap: bar_gap, bar_edge: bar_edge,
                         bar_edge_color: bar_edge_color, bar_edge_width: bar_edge_width))
    end

    def view
      Rubyplot::Plotspace.new(self).view!
    end

    def save(file_name)
      Rubyplot::Plotspace.new(self).save!(file_name)
    end

  end
end
