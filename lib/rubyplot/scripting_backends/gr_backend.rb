module Rubyplot
  class Figure
    def scatter!(x_coordinates, y_coordinates, marker_size: :default,
                 marker_color: :default, marker_type: :default)
                #give opions for colors as rgb
      if @data_represent_flag
        puts("\nThe figure is of data representation type")
        return
      else
        @data_plot_flag = true
      end

      if x_coordinates.min < @x_range[0]
        @x_range[0] = x_coordinates.min
      elsif x_coordinates.max > @x_range[1]
        @x_range[1] = x_coordinates.max
      end

      if y_coordinates.min < @y_range[0]
        @y_range[0] = y_coordinates.min
      elsif y_coordinates.max > @y_range[1]
        @y_range[1] = y_coordinates.max
      end

      @tasks.push(Scatter.new(x_coordinates, y_coordinates,
                  marker_size: marker_size, marker_color: marker_color,
                  marker_type: marker_type))
    end

    def line!(x_coordinates, y_coordinates, line_width: :default,
              line_color: :default, line_type: :default,
              marker_size: :default, marker_color: :default,
              marker_type: :default)
      if @data_represent_flag
        puts("\nThe figure is of data representation type")
        return
      else
        @data_plot_flag = true
      end

      if x_coordinates.min < @x_range[0]
        @x_range[0] = x_coordinates.min
      elsif x_coordinates.max > @x_range[1]
        @x_range[1] = x_coordinates.max
      end

      if y_coordinates.min < @y_range[0]
        @y_range[0] = y_coordinates.min
      elsif y_coordinates.max > @y_range[1]
        @y_range[1] = y_coordinates.max
      end

      @tasks.push(Line.new(x_coordinates, y_coordinates,
                           line_width: line_width, line_color: line_color,
                           line_type: line_type, marker_size: marker_size,
                           marker_color: marker_color,
                           marker_type: marker_type))
    end

    def bar!(data, base: :default ,bar_color: :default, bar_width: :default,
             bar_gap: :default, bar_edge: :default, bar_edge_color: :default,
             bar_edge_width: :default)
      if @data_plot_flag
        puts("\nThe figure is of data plotting type")
        return
      else
        @data_represent_flag = true
      end

      #data.min
      Tasks.push(Bar.new(data, base, bar_color: :default, bar_width: :default,
                         bar_gap: :default, bar_edge: :default,
                         bar_edge_color: :default, bar_edge_width: :default))
    end

    def view
      Rubyplot::Plotspace.new(self).view!
    end

    def save(file_name)
      Rubyplot::Plotspace.new(self).save!(file_name)
    end

  end
end
