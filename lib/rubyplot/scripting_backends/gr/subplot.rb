module Rubyplot
  class SubPlot
    include Rubyplot::GRWrapper::Tasks
    include Rubyplot::Color
    attr_accessor :backend, :x_title, :y_title, :x_range, :y_range,
                  :x_tick_count, :y_tick_count, :title, :text_font, :grid,
                  :bounding_box, :x_axis_padding, :y_axis_padding, :origin,
                  :title_shift, :tasks
    attr_reader :identity
    def initialize(num_rows, num_columns, index)
      puts identity
      @identity = [num_rows, num_columns, index]
      @tasks = []
      @x_title = ''
      @y_title = ''
      @x_range = [0, 0]
      @y_range = [0, 0]
      @origin = [:default, :default]
      @x_tick_count = :default
      @y_tick_count = :default
      @title = nil
      @title_shift = 0
      @text_font = :default
      @grid = true
      @bounding_box = true
      @x_axis_padding = :default
      @y_axis_padding = :default
      @xmin, @xmax, @ymin, @ymax = 1, 0, 1, 0
      r = @identity[0].to_f - (@identity[2].to_f - 1) / @identity[1].to_f
      c = (@identity[2].to_f - 1) % @identity[1].to_f + 1
      @xmin = [@xmin, (c - 1) / @identity[1].to_f].min
      @xmax = [@xmax, c / @identity[1].to_f].max
      @ymin = [@ymin, (r - 1) / @identity[0].to_f].min
      @ymax = [@ymax, r / @identity[0].to_f].max
    end

    def clear!
      @tasks = []
      @x_title = ''
      @y_title = ''
      @x_range = [0, 0]
      @y_range = [0, 0]
      @origin = [0, 0]
      @x_tick_count = :default
      @y_tick_count = :default
      @title = nil
      @title_shift = 0
      @text_font = :default
      @grid = true
      @bounding_box = true
      @x_axis_padding = :default
      @y_axis_padding = :default
    end
    def call
      @x_axis_padding = Math.log((@x_range[1] - @x_range[0]), 10).round
      @y_axis_padding =  Math.log((@y_range[1] - @y_range[0]), 10).round

      if @origin[0] == :default
        @origin[0] = @x_range[0] - @x_axis_padding
      end

      if @origin[1] == :default
        @origin[1] = @y_range[0] - @y_axis_padding
      end
      puts [@xmin, @xmax, @ymin, @ymax]
      SetViewPort.new(@xmin, @xmax, @ymin, @ymax).call
      SetWindow.new(@x_range[0] - @x_axis_padding, @x_range[1] + @x_axis_padding,
                    @y_range[0] - @y_axis_padding, @y_range[1] + @y_axis_padding).call
      # Make sure that window is set bigger than range figure out how to manage it
      SetTextAlign.new(2, 0).call
      @text_font = :times_roman if @text_font == :default
      SetTextFontPrecision.new(GR_FONTS[@text_font],
                               GR_FONT_PRECISION[:text_precision_string]).call
      SetCharHeight.new(0.012).call
      @y_tick_count = 10 if @y_tick_count == :default
      @x_tick_count = 10 if @x_tick_count == :default # 10 ticks by default
      SetLineColorIndex.new(hex_color_to_gr_color_index(COLOR_INDEX[:black])).call
      SetLineWidth.new(1).call
      SetLineType.new(GR_LINE_TYPES[:solid]).call
      Grid.new((@x_range[1] - @x_range[0]).to_f / @x_tick_count,
               (@y_range[1] - @y_range[0]).to_f / @y_tick_count,
               0, 0, 1, 1).call
      Axes.new((@x_range[1] - @x_range[0]).to_f / @x_tick_count,
               (@y_range[1] - @y_range[0]).to_f / @y_tick_count,
               @origin[0], @origin[1], 1, 1, 0.01).call
      AxesTitles.new(@x_title, @y_title,'').call
      @tasks.each do |task|
        task.call() if task.plot_type == :robust
        task.call(self) if task.plot_type == :lazy
      end
    end
  end
end
