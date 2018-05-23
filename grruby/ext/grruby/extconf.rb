require 'mkmf'

$CXXFLAGS += " -I/usr/local/gr/include "
$LDFLAGS += " -L/usr/local/gr/lib -lGR -lm -rpath,/usr/local/gr/lib "

create_makefile('grruby/grruby')