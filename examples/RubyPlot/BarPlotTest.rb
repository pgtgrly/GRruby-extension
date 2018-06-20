require_relative "../../lib/grruby"
g = Rubyplot::Bar.new()
g.title="My Bar My Rules!!!"
g.data('data', [5, 12, 1, 6, 7])
g.write('bar.bmp')