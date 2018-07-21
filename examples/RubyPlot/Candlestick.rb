require_relative '../../lib/grruby'
open_ = [10, 15, 24, 18]
high = [20, 25, 30, 18]
low = [5, 13, 15, 3]
close_ = [15, 24, 18, 4]
a = Rubyplot::Figure.new
a.candlestick! open_, high, low, close_, bar_width: 0.5, bar_gap: 0.25
a.view
