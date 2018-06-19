
module Rubyplot

  class Bar < Rubyplot::Artist
    def title

    end
    def marker_count

    end

    def data (dataname,datalist)
      @dataname = dataname
      @datalist = datalist
      @minval,@maxval= @datalist.minmax
      @yrange=[@minval-@minval,@maxval+@minval]
      @xrange=[0,@datalist.size]
    end

    def draw_bars
      
      @tasks.push(Draw_bar_class.new(@datalist,@yrange[0]))

    end

    def bar_set_axis

      @tasks.push(Bar_set_axes_class.new(@xrange,@yrange))
    end


    def draw
      bar_set_axis
      draw_bars
      super
    end

  
  end

end