require "../../lib/grruby.rb"
GR.selntran(1)
GR.setcharheight(0.024)

GR.setmarkertype(2)
GR.clearws()
GR.setcharup(1, 0)
GR.text(0.5, 0.5, 'namo')
GR.updatews()

puts("done")
hold=gets