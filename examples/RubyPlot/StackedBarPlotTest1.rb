require_relative '../../lib/grruby'
g = Rubyplot::Figure.new
g.title = 'Do you even lift Bro?'
g.text_font = :bookman_light_italic
values = [[12, 4, 53, 24],
          [4, 34, 8, 25],
          [20, 9, 31, 2],
          [56, 12, 84, 30]]
colors = ["#ff00ff","#00ffff",:lavender,"#ff0000"]
g.stacked_bar! values, bar_colors: colors, bar_gap: 1
g.view
