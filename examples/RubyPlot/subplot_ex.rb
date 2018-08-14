require_relative '../../lib/grruby'
@x1 = [1, 2, 3, 4, 5]
@y1 = [10, 20, 30, 40, 50]
@x2 = [2, 4, 16]
@y2 = [10, 20, -40]
@values = [0, 24, -12, 48]
@bars_data = [[12, 4, 53, 24],
              [4, 34, 8, 25],
              [20, 9, 31, 2],
              [56, 12, 84, 30]]
@open = [10, 15, 24, 18]
@high = [20, 25, 30, 18]
@low = [5, 13, 15, 3]
@close = [15, 24, 18, 4]
a = Rubyplot::Figure.new
a.subplot!(2, 2, 1)
a.line! @x1, @y1, marker_size: 1
a.scatter! @x2, @y2
a.subplot!(2, 2, 2)
a.bar! @values, bar_color: :orange, bar_gap: 1
#a.subplot!(2, 2, 3)
#a.line! @x1, @y1, line_color: :red, line_type: :dashed
#a.subplot!(2, 2, 4)
#a.candlestick! @open, @high, @low, @close, up_color: :blue, down_color: :black
#a.view
#a.clear!
#a.subplot!(2, 2, 3)
#a.clear!
a.subplot!(2, 1, 2)
a.clear!
a.scatter! @x2, @y2
a.view
a.clear_figure!
a.line! @x1, @y1, line_color: :red, line_type: :dashed
a.view
