module Rubyplot
  class Figure
    include Rubyplot::Scripting::Plots
    include Rubyplot::GRWrapper::Tasks
    attr_accessor :backend, :x_range, :y_range, :x_tick_count, :y_tick_count,
                  :title, :text_font, :grid, :bounding_box, :x_axis_padding,
                  :y_axis_padding
    attr_reader :tasks, :title_shift

    def initialize(backend: :default)
      @backend = backend
      @tasks = []
      @x_range = [0, 0]
      @y_range = [0, 0]
      @x_tick_count = :default
      @y_tick_count = :default
      @title = nil
      @title_shift = 0
      @text_font = :default
      @grid = true
      @bounding_box = true
      @data_represent_flag = false
      @data_plot_flag = false
      @x_axis_padding = :default
      @y_axis_padding = :default
      if @backend == :default || @backend == :GR
        require(__dir__.to_s << '/scripting_backends/gr/gr_backend')
      end
    end
    def clear!
      @tasks = []
      @x_range = [0, 0]
      @y_range = [0, 0]
      @x_tick_count = :default
      @y_tick_count = :default
      @title = nil
      @title_shift = 0
      @text_font = :default
      @grid = true
      @bounding_box = true
      @data_represent_flag = false
      @data_plot_flag = false
      @x_axis_padding = :default
      @y_axis_padding = :default
    end
  end
end
=begin
Known Bugs:
# set yrange and xrange to nil, would require change in spec images and origin shift
=end
