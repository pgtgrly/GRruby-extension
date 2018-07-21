module Rubyplot
  class Plotspace
    include Rubyplot::GRWrapper::Tasks
    def initialize(state)
      @state = state
    end

    def set_axis! # for internal use before drawing
      #Automate tick sizes so that it is not too conjested
      @state.title_shift = 0.1 unless @state.title.nil?

      @state.x_axis_padding = Math.log((@state.x_range[1] - @state.x_range[0]), 10).round
      @state.y_axis_padding =  Math.log((@state.y_range[1] - @state.y_range[0]), 10).round

      if @state.origin[0] == :default
        @state.origin[0] = @state.x_range[0] - @state.x_axis_padding
      end

      if @state.origin[1] == :default
        @state.origin[1] = @state.y_range[0] - @state.y_axis_padding
      end

      SetViewPort.new(0.05, 0.99, 0.05, 0.99 - @state.title_shift).call
      SetWindow.new(@state.x_range[0] - @state.x_axis_padding, @state.x_range[1] + @state.x_axis_padding,
                    @state.y_range[0] - @state.y_axis_padding, @state.y_range[1] + @state.y_axis_padding).call
      # Make sure that window is set bigger than range figure out how to manage it
      SetTextAlign.new(2, 0).call
      @state.text_font = :times_roman if @state.text_font == :default
      SetTextFontPrecision.new(GR_FONTS[@state.text_font],
                               GR_FONT_PRECISION[:text_precision_string]).call
      SetCharHeight.new(0.012).call
      @state.y_tick_count = 10 if @state.y_tick_count == :default
      @state.x_tick_count = 10 if @state.x_tick_count == :default # 10 ticks by default
      SetLineColorIndex.new(inqcolorfromrgb(COLOR_INDEX[:black])).call
      SetLineWidth.new(1).call
      SetLineType.new(GR_LINE_TYPES[:solid]).call
      Grid.new((@state.x_range[1] - @state.x_range[0]).to_f / @state.x_tick_count,
               (@state.y_range[1] - @state.y_range[0]).to_f / @state.y_tick_count,
               0, 0, 1, 1).call
      Axes.new((@state.x_range[1] - @state.x_range[0]).to_f / @state.x_tick_count,
               (@state.y_range[1] - @state.y_range[0]).to_f / @state.y_tick_count,
               @state.origin[0], @state.origin[1], 1, 1, 0.01).call
      if @state.title_shift != 0
        SetCharHeight.new(0.05).call
        Text.new(0.5, 0.9, @state.title).call
      end
    end

    def view!
      set_axis!
      @state.tasks.each do |task|
        task.call() if task.plot_type == :robust
        task.call(@state) if task.plot_type == :lazy
      end
      UpdateWorkspace.new.call
      puts("\nPress any button to continue")
      gets
      ClearWorkspace.new.call
    end

    def save!(file_name)
      BeginPrint.new(file_name).call
      set_axis!
      @state.tasks.each do |task|
        task.call() if task.plot_type == :robust
        task.call(@state) if task.plot_type == :lazy
      end
      EndPrint.new.call
    end
  end
end
