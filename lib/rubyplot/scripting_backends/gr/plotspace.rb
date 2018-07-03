module Rubyplot
  class Plotspace
    include Rubyplot::GRWrapper::Tasks
    def initialize(state)
      @tasks = state.tasks
      @x_range = state.x_range
      @y_range = state.y_range
      @x_tick_count = state.x_tick_count
      @y_tick_count = state.y_tick_count
      @title = state.title
      @title_shift = state.title_shift
      @text_font = state.text_font
      @grid = state.grid
      @bounding_box = state.bounding_box
      @x_axis_padding = state.x_axis_padding
      @y_axis_padding = state.y_axis_padding
    end

    def set_axis! # for internal use before drawing
      #Automate tick sizes so that it is not too conjested
      if !@title.nil? # GR framework requires axes to be set up before plotting
        @title_shift = 0.1 # only decrease the plotting area if title is present
      end

      if @x_axis_padding == :default
        @x_axis_padding =  Math.log((@x_range[1] - @x_range[0]), 10).round
      end


      @y_axis_padding =  Math.log((@y_range[1] - @y_range[0]), 10).round
      SetViewPort.new(0.05, 0.99, 0.05, 0.99 - @title_shift).call
      SetWindow.new(@x_range[0] - @x_axis_padding, @x_range[1] + @x_axis_padding,
                    @y_range[0] - @y_axis_padding, @y_range[1] + @y_axis_padding).call
      # Make sure that window is set bigger than range figure out how to manage it
      SetTextAlign.new(2, 0).call
      if @text_font == :default
        @text_font = :times_roman
      end
      SetTextFontPrecision.new(GR_FONTS[@text_font],
                               GR_FONT_PRECISION[:text_precision_string]).call
      SetCharHeight.new(0.012).call
      @y_tick_count = 10 if @y_tick_count == :default
      @x_tick_count = 10 if @x_tick_count == :default # 10 ticks by default
      @tasks.push(SetLineColorIndex.new(GR_COLOR_INDEX[:black]))
      @tasks.push(SetLineWidth.new(1))
      @tasks.push(SetLineType.new(GR_LINE_TYPES[:solid]))
      Grid.new((@x_range[1] - @x_range[0]).to_f / @x_tick_count,
               (@y_range[1] - @y_range[0]).to_f / @y_tick_count,
               0, 0, 1, 1).call
      Axes.new((@x_range[1] - @x_range[0]).to_f / @x_tick_count,
               (@y_range[1] - @y_range[0]).to_f / @y_tick_count,0, 0, 1, 1, 0.01).call
      if @title_shift != 0
        SetCharHeight.new(0.05).call
        Text.new(0.5, 0.9, @title).call
      end
    end

    def view!
      set_axis!
      @tasks.each do |task|
        task.call()
      end
      UpdateWorkspace.new.call
      puts("\nPress any button to continue")
      gets
      ClearWorkspace.new.call
    end

    def save!(file_name)
      BeginPrint.new(file_name).call
      set_axis!
      @tasks.each do |task|
        task.call()
      end
      EndPrint.new.call
    end
  end
end
