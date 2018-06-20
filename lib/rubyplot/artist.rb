module Rubyplot
  class Artist
    attr_accessor :title
    def initialize
      @tasks = []
      @title = nil
      @drawn_flag = false
    end

    def draw
      return if @drawn_flag 
      @drawn_flag = true    
    end

    def write(filename)
      draw
      GrBeginPrint.new(filename).call
      @tasks.each do |task|
        task.call()
      end
      GrEndPrint.new.call
    end

    def display
      draw
      @tasks.each do |task|
        task.call()
      end
      GrUpdateWs.new.call
      puts("\nPress any button to continue")
      gets
    end

    def add_legend(dataname)

    end
  end
end
