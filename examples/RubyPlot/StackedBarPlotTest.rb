require_relative '../../lib/grruby'
values = [[12, 4, 53, 24],
          [4, 34, 8, 25],
          [20, 9, 31, 2],
          [56, 12, 84, 30]]
          colors = ["000000","00ffff","ff00ff","ff0000"]
a = Rubyplot::Figure.new
a.stacked_bar! values,colors
a.view
