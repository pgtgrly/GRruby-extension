require_relative '../../lib/grruby'
values = [0, 24, 12, 48]
a = Rubyplot::Figure.new
a.bar! values, bar_color: :blue, bar_gap: 1
a.view