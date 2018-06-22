require_relative '../../lib/grruby'
g = Rubyplot::Figure.new()
#g.title = 'This is Scatter'
@x1 = [1, 2, 3, 4, 5]
@y1 = [10, 29, 30, 40, 50]
@x2 = [2, 16, 4]
@y2 = [10, 20, -40]
g.scatter @x1, @y1
g.scatter @x2, @y2, marker_color: 989, ## Figure out how to make constants work
                marker_size: 2, marker_type: -9
g.save("scatter.bmp")
g.view
