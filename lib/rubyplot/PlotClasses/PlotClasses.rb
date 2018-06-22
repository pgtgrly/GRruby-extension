module Rubyplot
  module Scripting
    module Plots
      class Base
        include Rubyplot::GRWrapper::Tasks
        def call
          @tasks.each do |task|
            task.call()
          end
        end
      end
      class Scatter < Base
          # To do  declare constants for marker types and colours
          # Allow list of types and colours to be passed
        def initialize(x_coordinates,y_coordinates,marker_color: 'default',
                       marker_size: 'default', marker_type: 'default')
          @tasks = []
          marker_color = BLACK if marker_color == 'default'
          marker_size = 0.5 if marker_size == 'default'
          marker_type = SOLID_CIRCLE if marker_type == 'default'
          @tasks.push(SetMarkerColorIndex.new(marker_color))
          @tasks.push(SetMarkerSize.new(marker_size))
          @tasks.push(SetMarkerType.new(marker_type))
          @tasks.push(Polymarker.new(x_coordinates,y_coordinates))
        end
      end
      class Line < Base
            # To do  declare constants for marker types and colours
            # Allow list of types and colours to be passed
        def initialize(x_coordinates,y_coordinates,marker_color: 'default',
                         marker_size: 'default', marker_type: 'default')
          @tasks = []
          marker_color = BLACK if marker_color == 'default'
          marker_size = 0.5 if marker_size == 'default'
          marker_type = SOLID_CIRCLE if marker_type == 'default'
          @tasks.push(SetMarkerColorIndex.new(marker_color))
          @tasks.push(SetMarkerSize.new(marker_size))
          @tasks.push(SetMarkerType.new(marker_type))
          @tasks.push(Polymarker.new(x_coordinates,y_coordinates))
        end
      end
    end
  end
end
