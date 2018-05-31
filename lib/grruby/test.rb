require "./grruby"
GRruby.setviewport(0.1, 0.95, 0.1, 0.95)
GRruby.setwindow(-10, 10, -10, 10)
GRruby.setspace(-0.5, 0.5, 0, 90)
GRruby.setmarkersize(1.0)
GRruby.setmarkertype(-1)
GRruby.setcharheight(0.012)
GRruby.settextalign(2, 0)
GRruby.settextfontprec(103, 0)
GRruby.setfillintstyle(3)
j=1;
while j<50;
	i=1
	x=[0]
	y=[0.25*(-1)**j]
	GRruby.axes(1, 1, 0.0, 0.0, 1, 1, 0.01)
	GRruby.updatews()
	while (i<10) do 
		x.insert(-1,x[-1]+1*(-1)**j)
		y.insert(-1,y[-1]*1.5)
		GRruby.fillarea(x,y)
		GRruby.polymarker(x,y)
		sleep(0.5)
		GRruby.updatews()
		GRruby.textext(1,1,"GRruby!")
		i+=1
		
	end
	sleep(1)
	GRruby.clearws()
	j+=1
end
puts("done")
hold=gets