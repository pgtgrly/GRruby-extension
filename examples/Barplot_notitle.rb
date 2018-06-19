require_relative "../lib/grruby"
g = Rubyplot::Bar.new()
g.data('data', [-5, 12, 1, 6, 7])
g.margin = 2
g.marker_count = 42
g.write('bar_notitle.bmp')