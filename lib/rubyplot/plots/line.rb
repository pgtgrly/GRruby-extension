module Rubyplot
  module Plots
    class Line < Base
      # TODO: declare constants for marker types and colours
      # Allow list of types and colours to be passed
      def initialize(x_coordinates,y_coordinates, line_width: :default,
                     line_color: :default, line_type: :default,
                     marker_size: :default, marker_color: :default,
                     marker_type: :default)
        @tasks = []
        if marker_size != :default
          marker_color = :black if marker_color == :default
          marker_type = :solid_circle if marker_type == :default
          @tasks.push(SetMarkerColorIndex.new(GR_COLOR_INDEX[marker_color]))
          @tasks.push(SetMarkerSize.new(marker_size))
          @tasks.push(SetMarkerType.new(GR_MARKER_SHAPES[marker_type]))
          @tasks.push(Polymarker.new(x_coordinates, y_coordinates))
        end
        line_color = :black if line_color == :default
        line_width = 1 if line_width == :default
        line_type = :solid if line_type == :default
        @tasks.push(SetLineColorIndex.new(GR_COLOR_INDEX[line_color]))
        @tasks.push(SetLineWidth.new(line_width))
        @tasks.push(SetLineType.new(GR_LINE_TYPES[line_type]))
        @tasks.push(Polyline.new(x_coordinates, y_coordinates))
      end
    end
  end
end
