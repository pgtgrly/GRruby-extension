require_relative '../../lib/grruby'
g = Rubyplot::Figure.new()
g.title = 'This is Scatter'
@x1 = [1, 2, 3, 4, 5]
@y1 = [10, 20, 30, 40, 50]
g.scatter @x1, @y1
g.save("scatter.bmp")
