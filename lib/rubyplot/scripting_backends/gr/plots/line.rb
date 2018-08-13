module Rubyplot
  module Scripting
    module Plots
      class Line < BasePlots::RobustBase
        def initialize(x_coordinates, y_coordinates, line_width: :default,
                       line_color: :default, line_type: :default,
                       marker_size: :default, marker_color: :default,
                       marker_type: :default)
          super()
          if marker_size != :default
            marker_color = COLOR_INDEX[:black] if marker_color == :default
            marker_color = COLOR_INDEX[marker_color] if marker_color.is_a? Symbol
            marker_type = :solid_circle if marker_type == :default
            @tasks.push(SetMarkerColorIndex.new(hex_color_to_gr_color_index(marker_color)))
            @tasks.push(SetMarkerSize.new(marker_size))
            @tasks.push(SetMarkerType.new(GR_MARKER_SHAPES[marker_type]))
            @tasks.push(Polymarker.new(x_coordinates, y_coordinates))
          end
          line_color = COLOR_INDEX[:black] if line_color == :default
          line_color = COLOR_INDEX[line_color] if line_color.is_a? Symbol
          line_width = 1 if line_width == :default
          line_type = :solid if line_type == :default
          @tasks.push(SetLineColorIndex.new(hex_color_to_gr_color_index(line_color)))
          @tasks.push(SetLineWidth.new(line_width))
          @tasks.push(SetLineType.new(GR_LINE_TYPES[line_type]))
          @tasks.push(Polyline.new(x_coordinates, y_coordinates))
        end
      end
    end
  end
end
