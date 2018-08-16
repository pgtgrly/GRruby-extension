require_relative '../../lib/grruby'
g = Rubyplot::Figure.new()
g.title ('This is a Fancy Graph')
@x1 = [1, 2, 3, 4, 5]
@y1 = [10, 29, 30, 40, 50]
@x2 = [2, 16, 4]
@y2 = [10, -5, -10]
g.text_font = :bookman_light_italic
g.line! @x1, @y1, line_width: 2,
               line_color: :red, line_type: :long_short_dash,
               marker_size: 2
g.scatter! @x2, @y2, marker_color: :green,
                marker_size: 2, marker_type: :solid_tri_left
g.save("scatter.bmp")
g.view
