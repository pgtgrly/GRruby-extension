require_relative '../../lib/grruby'
g = Rubyplot.new
g.bar!([-5, 12, 1, 6, 7])
g.write('bar_notitle.bmp')
