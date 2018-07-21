require_relative '../../lib/grruby'
values = [0, 24, -12, 48]
RM = 1e4
CM = 1e-3
V = [50]
t = [1]
(1..1000).to_a.each do
  V << (V[-1] - V[-1] * 0.1 / (RM * CM))
  t << (t[-1] + 0.1)
end
a = Rubyplot::Figure.new
a.bar! values, bar_color: :green, bar_gap: 1
a.line!(t, V)
a.view
