module Rubyplot
  module Plots
    class Base
      include Rubyplot::GRWrapper::Tasks
      def call
        @tasks.each do |task|
          task.call
        end
      end
    end
  end
end

require_relative 'plots/line'
require_relative 'plots/scatter'
