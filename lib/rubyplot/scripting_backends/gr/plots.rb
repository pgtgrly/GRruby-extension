module Rubyplot
  module Scripting
    module Plots
      class RobustBase
        include Rubyplot::GRWrapper::Tasks
        attr_reader :plot_type
        def initialize
          @plot_type = :robust
        end

        def call
          @tasks.each do |task|
            task.call()
          end
        end
      end
      class LazyBase # call function will be unique for every plot
        include Rubyplot::GRWrapper::Tasks
        attr_reader :plot_type
        def initialize
          @plot_type = :lazy
        end
      end
    end
  end
end

require_relative './plots/line.rb'
require_relative './plots/scatter.rb'
require_relative './plots/bar.rb'
