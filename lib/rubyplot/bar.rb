
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

    def draw_bars # Adds the instance to draw bars to task list
      
      @tasks.push(Draw_bar_class.new(@datalist,@yrange[0]))

    end

    def bar_set_axes #GR framework requires axex to be set up before plotting

      @tasks.push(Bar_set_axes_class.new(@xrange,@yrange,@title))
    end


    def draw
      bar_set_axes
      draw_bars
      super
    end

  
  end

end