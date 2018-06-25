require_relative '../../lib/grruby'
g = Rubyplot::Figure.new()
g.title = 'This is Scatter'
@x1 = [1, 2, 3, 4, 5]
@y1 = [10, 29, 30, 40, 50]
@x2 = [2, 16, 4]
@y2 = [10, -5, -10]
g.text_font = :BOOKMAN_LIGHT_ITALIC
g.line @x1, @y1, line_width: 2,
               line_color: :GREEN, line_type: :LONG_SHORT_DASH,
               marker_size: 2, marker_color: :default,
               marker_type: :default
g.scatter @x2, @y2, marker_color: :GREEN, ## Figure out how to make constants work
                marker_size: 2, marker_type: :CIRCLE
g.save("scatter.bmp")
g.view
