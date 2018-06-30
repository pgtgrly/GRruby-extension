module Rubyplot
  module Plots
    class Scatter < Base
      # TODO: declare constants for marker types and colours
      # Allow list of types and colours to be passed
      def initialize(x_coordinates,y_coordinates, marker_size: :default,
                     marker_color: :default, marker_type: :default)
        @tasks = []
        marker_color = :black if marker_color == :default
        marker_size = 1 if marker_size == :default
        marker_type = :solid_circle if marker_type == :default
        @tasks.push(SetMarkerColorIndex.new(GR_COLOR_INDEX[marker_color]))
        @tasks.push(SetMarkerSize.new(marker_size))
        @tasks.push(SetMarkerType.new(GR_MARKER_SHAPES[marker_type]))
        @tasks.push(Polymarker.new(x_coordinates, y_coordinates))
      end
    end
  end
end

