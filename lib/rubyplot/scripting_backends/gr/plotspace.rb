module Rubyplot
  # Plotspace is the class which begins plotting of the plot.
  # When the user calls save or view, the state of the Figure is copied to the plotspace.
  #
  # The subplot list is present in Figure and when user calls view or save this list begins
  # executing and subplots are plotted. Each subplot has a task list which begins executing when 
  # the subplot starts executing.
  #
  # @author Pranav Garg
  class Plotspace
    include Rubyplot::GRWrapper::Tasks
    include Rubyplot::Color
    def initialize(state)
      @state = state
    end
	
	# To view the Figure
    def view!
      @state.subplots_list.each do |subplot|
        subplot.call
      end
      UpdateWorkspace.new.call
      puts("\nPress Enter to continue")
      gets
      ClearWorkspace.new.call
    end
	
	# To save the figure, currently only as .BMP files
    # known bug : save is not giving same output as view,in some cases
    #  this is an internal error in  GR Framework
    # @param file_name [String] name of the file where the figure needs to be saved
    def save!(file_name)
      BeginPrint.new(file_name).call
      @state.subplots_list.each do |subplot|
        subplot.call
      end
      EndPrint.new.call
    end
  end
end
