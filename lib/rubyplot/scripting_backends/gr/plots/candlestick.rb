module Rubyplot
  module Scripting
    module Plots
      class Candlestick < BasePlots::RobustBase
        def initialize(open_, high, low, close_, bar_gap, bar_width,
                       up_color: :default, down_color: :default,
                       up_line_color: :default, down_line_color: :default)
          super()
          up_color = COLOR_INDEX[:green] if up_color == :default
          up_color = COLOR_INDEX[up_color] if up_color.is_a? Symbol
          down_color = COLOR_INDEX[:red] if down_color == :default
          down_color = COLOR_INDEX[down_color] if down_color.is_a? Symbol
          up_line_color = COLOR_INDEX[:black] if up_line_color == :default
          up_line_color = COLOR_INDEX[up_line_color] if up_line_color.is_a? Symbol
          down_line_color = COLOR_INDEX[:black] if down_line_color == :default
          down_line_color = COLOR_INDEX[down_line_color] if down_line_color.is_a? Symbol
          (0..open_.size - 1).to_a.each do |i|
            if close_[i] > open_[i]
              bar_color = up_color
              line_color = up_line_color
            else
              bar_color = down_color
              line_color = down_line_color
            end
            x_coord = i * (bar_width + bar_gap) + bar_width.to_f/2
            @tasks.push(SetLineColorIndex.new(hex_color_to_gr_color_index(line_color)))
            @tasks.push(Polyline.new([x_coord] * 2, [low[i], high[i]]))
            @tasks.push(SetFillColorIndex.new(hex_color_to_gr_color_index(bar_color)))
            @tasks.push(SetFillInteriorStyle.new(GR_FILL_INTERIOR_STYLES[:solid]))
            @tasks.push(FillRectangle.new(i * (bar_width + bar_gap),
                         i * (bar_width + bar_gap) + bar_width,
                         open_[i], close_[i]))

          end
        end
      end
    end
  end
end
