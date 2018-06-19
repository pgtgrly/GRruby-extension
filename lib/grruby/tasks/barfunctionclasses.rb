class Draw_bar_class
  def initialize(datalist,basevalue)
    @datalist=datalist
    @basevalue=basevalue

  end
  def call
    (0..@datalist.size-1).to_a.each do |i|
      GR.setfillcolorind(989)
      GR.setfillintstyle(1)
      GR.fillrect(i,i+1,@basevalue,@datalist[i])
      GR.setfillcolorind(1)
      GR.setfillintstyle(0)
      GR.fillrect(i,i+1,@basevalue,@datalist[i])
    end
    
  end
end

class Bar_set_axes_class
  def initialize(xrange,yrange,title)
    @xrange = xrange
    @yrange = yrange
    @title = title
    @titleshift=0
    if @title !=NIL
      @titleshift=0.1
    end
  end

  def call()
    GR.setviewport(0.05, 0.99, 0.05, 0.99-@titleshift)# make it user defined
    GR.setwindow(@xrange[0], @xrange[1], @yrange[0], @yrange[1])
    GR.setmarkersize(1.0)#
    GR.setmarkertype(-1)#
    GR.settextalign(2, 0)#
    GR.settextfontprec(103, 0)#
    GR.setcharheight(0.012)
    GR.axes(1,(@yrange[1]-@yrange[0])/10,0,0,1,1,0.01)
    if @titleshift
      GR.setcharheight(0.05)
      GR.text(0.5,0.9,@title)
    end
  end


end