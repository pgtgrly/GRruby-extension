require_relative '../../lib/grruby'
g = Rubyplot::Figure.new
g.bar!([-5, 12, 1, 6, 7])
g.save('bar_notitle.bmp')
