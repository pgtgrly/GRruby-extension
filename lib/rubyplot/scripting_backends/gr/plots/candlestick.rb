module Rubyplot
  module Scripting
    module Plots
      class Candlestick < RobustBase
            # To do  declare constants for marker types and colours
            # Allow list of types and colours to be passed
        def initialize(open_, high, low, close_, bar_gap, bar_width,
                       up_color: :default, down_color: :default,
                       up_line_color: :default, down_line_color: :default)
          super()
          up_color = inqcolorfromrgb('00ff00') if up_color == :default
          down_color = inqcolorfromrgb('ff0000') if down_color == :default
          up_line_color = inqcolorfromrgb('000000') if up_line_color == :default
          down_line_color = inqcolorfromrgb('000000') if down_line_color == :default
          (0..open_.size - 1).to_a.each do |i|
            if open_[i] > close_[i]
              bar_color = up_color
              line_color = up_line_color
            else
              bar_color = down_color
              line_color = down_line_color
            end
            x_coord = i * (bar_width + bar_gap) + bar_width.to_f/2
            puts x_coord
            @tasks.push(SetLineColorIndex.new(line_color))
            @tasks.push(Polyline.new([x_coord] * 2, [low[i], high[i]]))
            @tasks.push(SetFillColorIndex.new(bar_color))
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
