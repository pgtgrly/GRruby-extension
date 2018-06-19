
module Rubyplot

  class Bar < Rubyplot::Artist
    attr_accessor :margin, :marker_count
    

    def data (dataname,datalist) 
      @dataname = dataname
      @datalist = datalist
      @minval,@maxval= @datalist.minmax
      @margin=1 #decides how many tick above the higest value and below the lowest value
      @marker_count="default"
    end

    def draw_bars # Adds the instance to draw bars to task list
      
      @tasks.push(Draw_bar_class.new(@datalist,@yrange[0]))

    end

    def bar_set_axes #GR framework requires axex to be set up before plotting

      @tasks.push(Bar_set_axes_class.new(@xrange,@yrange,@title,@marker_count))
    end


    def draw
      @yrange=[@minval-@margin,@maxval+@margin]
      @xrange=[0,@datalist.size]
      bar_set_axes
      draw_bars
      super
    end

  
  end

end