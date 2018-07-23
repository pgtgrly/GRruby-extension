require_relative '../../lib/grruby'
g = Rubyplot::Figure.new
g.title = 'This is Art'
@x1 = [1, 2, 3, 4, 5]
@y1 = [10, 29, 30, 40, 50]
@x2 = [2, 16, 4]
@y2 = [10, -5, -10]
g.text_font = :bookman_light_italic
values = [[12, 4, 53, 24],
          [4, 34, 8, 25],
          [20, 9, 31, 2],
          [56, 12, 84, 30]]
g.stacked_bar! values, bar_gap: 1
g.line! @x1, @y1, line_width: 2,
                  line_color: :red, line_type: :long_short_dash,
                  marker_size: 2
g.scatter! @x2, @y2, marker_color: "#af00f8",
                     marker_size: 2, marker_type: :solid_tri_left
g.view
