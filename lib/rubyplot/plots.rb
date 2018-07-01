module Rubyplot
  module Scripting
    module Plots
      class Base
        include Rubyplot::GRWrapper::Tasks
        def call
          @tasks.each do |task|
            task.call()
          end
        end
      end
    end
  end
end

require_relative './plots/line.rb'
require_relative './plots/scatter.rb'
#require_relative './plots/bar.rb'
