module Rubyplot
  class Rbplot
    include Scripting::Plots
    attr_accessor :title
    def initialize
      @tasks = []
      @x_min = 0
      @x_max = 0
      @y_min = 0
      @y_max = 0
      @x_tick_space = 1
      @y_tick_space = 1
      @title = nil
      @drawn_flag = false
      @margin = 1 # Decides how many ticks above the higest value and
      @ticks_count = 'default'
      @marker_size = 'default'
      @marker_color = 'default'
      @grid = true
      @bounding_box = true
    end

    def scatter(x,y)
      x.each do |i|
        if i < @x_min
          @x_min = i
        elsif i > @x_max
          @x_max = i
        end
      end
      y.each do |i|
        if i < @y_min
          @y_min = i
        elsif i > @y_max
          @y_max = i
        end
      end
      @tasks.push(Scatterplotclass.new(x, y))
    end

    def line(x, y)
      x.each do |i|
        if i < @x_min
          @x_min = i
        elsif i > @x_max
          @x_max = i
        end
      end
      y.each do |i|
        if i < @y_min
          @y_min = i
        elsif i > @y_max
          @y_max = i
        end
      end
      @tasks.push(Linegraphclass.new(x, y))
    end
    def setaxis

    end

    def draw
      return if @drawn_flag
      @drawn_flag = true
    end



    def view
      @x_tick_space = ((@x_max - @x_min)/10).round # should be user definable
      @y_tick_space = ((@y_max - @y_min)/10).round
      @x_max+=@x_tick_space
      @x_min-=@x_tick_space
      @y_max+=@y_tick_space
      @y_min-=@y_tick_space
      GR.setviewport(0.01, 0.99, 0.01, 0.99) # make it user defined
      GR.setwindow(@x_min, @x_max, @y_min, @y_max)
      GR.setmarkersize(1.0)#
      GR.setmarkertype(-1)#
      GR.settextalign(2, 0)#
      GR.settextfontprec(103, 0)#
      GR.setfillintstyle(1)#
      GR.setcharheight(0.012)#
      GR.axes(@x_tick_space, @y_tick_space, 0, 0, 1, 1, 0.01)#
      for a in @tasks
        a.call
      end
      GR.updatews()
      hold=gets
    end

    def save(file_name)
      GR.beginprint(file_name)
      for a in @tasks
        a.call
      end
      GR.endprint()
    end
  end
end

=begin
    class
      attr_accessor :title
      def initialize
        @tasks = []
        @title = nil
        @drawn_flag = false
      end

      def draw
        return if @drawn_flag
        @drawn_flag = true
      end

      def write(filename)
        draw
        GrBeginPrint.new(filename).call
        @tasks.each do |task|
          task.call()
        end
        GrEndPrint.new.call
      end

      def display
        draw
        @tasks.each do |task|
          task.call()
        end
        GrUpdateWs.new.call
        puts("\nPress any button to continue")
        gets
    end

=end
