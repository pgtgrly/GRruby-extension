module Rubyplot
  class Plotspace
    include Rubyplot::GRWrapper::Tasks
    include Rubyplot::Color
    def initialize(state)
      @state = state
    end

    def view!
      @state.subplots_list.each do |subplot|
        subplot.call
      end
      UpdateWorkspace.new.call
      puts("\nPress Enter to continue")
      gets
      ClearWorkspace.new.call
    end

    def save!(file_name)
      BeginPrint.new(file_name).call
      @state.subplots_list.each do |subplot|
        subplot.call
      end
      EndPrint.new.call
    end
  end
end
