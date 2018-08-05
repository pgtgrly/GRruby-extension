module Rubyplot
  class Figure
    include Rubyplot::Scripting::Plots
    include Rubyplot::GRWrapper::Tasks
    attr_accessor :backend, :x_title, :y_title, :x_range, :y_range,
                  :x_tick_count, :y_tick_count, :text_font, :grid,
                  :bounding_box, :x_axis_padding, :y_axis_padding, :origin,
                  :title_shift, :subplots_list
    attr_reader :tasks

    def initialize(backend: :default)
      @backend = backend
      @subplots_list = [Rubyplot::SubPlot.new(1, 1, 1)]
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
      if @backend == :default || @backend == :GR
        require(__dir__.to_s << '/scripting_backends/gr/gr_backend')
      end
      @active_subplot = @subplots_list[0]
      @no_subplot = true
    end

    def clear!
      @subplots_list = [Rubyplot::SubPlot.new(1, 1, 1)]
      @no_subplot = true
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
      @active_subplot = @subplots_list[0]
    end

    def subplot!(num_rows, num_columns, index)
      if @no_subplot
        @no_subplot = false
        @subplots_list = []
      end
      subplot_id = [num_rows, num_columns, index]
      subplots_list_index = @subplots_list.map{ |x| x.identity }.index subplot_id
      if subplots_list_index.nil? == false
        @active_subplot = @subplots_list[subplots_list_index]
      else
        @active_subplot = Rubyplot::SubPlot.new(num_rows, num_columns, index)
        @subplots_list.push(@active_subplot)
      end
    end

    def title(title_string)
      @active_subplot.title = title_string
    end
  end
end
=begin
Known Bugs:
# set yrange and xrange to nil, would require change in spec images and origin shift
=end
