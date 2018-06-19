require "../lib/grruby.rb"
GR.setviewport(0.1, 0.95, 0.1, 0.95)
GR.setwindow(-10, 10, -10, 10)
GR.setspace(-0.5, 0.5, 0, 90)
GR.setmarkersize(1.0)
GR.setmarkertype(-1)
GR.settextalign(2, 0)
GR.settextfontprec(103, 0)
GR.setfillintstyle(1)
GR.setcharheight(0.048)
GR.text(0.25, 0.75, "GR\nRocks!")
j=0;
while j<50
  puts( (j+1).to_s() + " out of 50\n")
  i=1
  x=[0]
  y=[0.25*(-1)**j]
  GR.setcharheight(0.012)
  GR.axes(1, 1, 0.0, 0.0, 1, 1, 0.01)
  GR.updatews()
  while (i<10) do 
    x.insert(-1,x[-1]+1*(-1)**j)
    y.insert(-1,y[-1]*1.5)
    if x.size >2 and y.size >2
      GR.fillarea(x,y)
    end
    GR.polyline(x,y)
    GR.polymarker(x,y)
    sleep(0.5)
    GR.updatews()
    i+=1    
  end
  sleep(1)
  GR.clearws()
  GR.setcharheight(0.048)
  GR.text(0.25, 0.75, "GR\nRocks!")
  j+=1
end

puts("done")
hold=gets