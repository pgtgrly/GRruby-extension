module Rubyplot
  module Scripting
    module Plots
      class Bar < Base
        def initialize(data, bar_color: :default, bar_width: :default,
                       bar_gap: :default, bar_edge: :default,
                       bar_edge_color: :default, bar_edge_width: :default,
                       base)
          @tasks = []
          bar_color = :easy_blue if bar_color == :default
          bar_gap = 0 if bar_gap == :default
          bar_width = 1 if bar_width == :default
          bar_edge = true if bar_edge == :default
          bar_edge_color = :black if bar_edge_color == :default
          bar_edge_width = 0.01 if bar_edge_width == :default
          (0..data.size - 1).to_a.each do |i|
            if bar_edge
              @tasks.push(SetFillColorInd.new(GR_COLOR_INDEX[bar_edge_color]))
              @tasks.push(SetFillIntStyle.new(GR_FILL_INTERIOR_STYLE[:solid]))
              @tasks.push(FillRect.new(i * (bar_width + bar_gap) - bar_edge_width,
                                       i * (bar_width + bar_gap) + bar_width + bar_edge_width,
                                      base, @data[i] + bar_edge_width))
            end
            @tasks.push(SetFillColorInd.new(GR_COLOR_INDEX[bar_color]))
            @tasks.push(SetFillIntStyle.new(GR_FILL_INTERIOR_STYLE[:solid])))
            @tasks.push(FillRect.new(i * (bar_width + bar_gap),
                                     i * (bar_width + bar_gap) + bar_width,
                                    base, @data[i]))
          end
        end
      end
    end
  end
end
=begin
module Rubyplot
  class Bar < Rubyplot::Artist
    attr_accessor :margin, :marker_count
    def data(dataname, datalist)
      @dataname = dataname
      @datalist = datalist
      @minval, @maxval = @datalist.minmax
      @margin = 1 # Decides how many ticks above the higest value and
      @marker_count = 'default' # below the lowest value
      @titleshift = 0
    end

    def draw_bars
      (0..@datalist.size - 1).to_a.each do |i| # Adds the instance to draw bars
        @tasks.push(GrSetFillColorInd.new(989)) # to task list
        @tasks.push(GrSetFillIntStyle.new(1))
        @tasks.push(GrFillRect.new(i, i + 1, @yrange[0], @datalist[i]))
        @tasks.push(GrSetFillColorInd.new(1))
        @tasks.push(GrSetFillIntStyle.new(0))
        @tasks.push(GrFillRect.new(i, i + 1, @yrange[0], @datalist[i]))
      end
    end

    def bar_set_axes
      if @title != nil # GR framework requires axes to be set up before plotting
        @titleshift = 0.1 # only decrease the plotting area if title is present
      end
      @tasks.push(GrSetViewPort.new(0.05, 0.99, 0.05, 0.99 - @titleshift))
      @tasks.push(GrSetWindow.new(@xrange[0], @xrange[1], @yrange[0],
                                  @yrange[1]))
      @tasks.push(GrSetMarkerSize.new(1.0))
      @tasks.push(GrSetMarkerType.new(-1))
      @tasks.push(GrSetTextAlign.new(2, 0))
      @tasks.push(GrSetTextFontPrec.new(103, 0))
      @tasks.push(GrSetCharHeight.new(0.012))
      @marker_count = @yrange[1] - @yrange[0] if @marker_count == 'default'
      @tasks.push(GrAxes.new(1, (@yrange[1] - @yrange[0]).to_f / @marker_count,
                             @xrange[0], @yrange[0], 1, 1, 0.01))
      if @titleshift != 0
        @tasks.push(GrSetCharHeight.new(0.05))
        @tasks.push(GrText.new(0.5, 0.9, @title))
      end
    end

    def draw
      @yrange = [@minval - @margin, @maxval + @margin]
      @xrange = [0, @datalist.size]
      bar_set_axes
      draw_bars
      super
    end
  end
end
=end
