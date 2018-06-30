require 'spec_helper'

describe Rubyplot::Figure do
  before do
    @x1 = [1, 2, 3, 4, 5]
    @y1 = [10, 20, 30, 40, 50]
  end

  context '#line!' do
    it 'creates a simple line graph' do
      a = Rubyplot::Figure.new
      a.line! @x1, @y1
      a.save 'file_name.bmp'

      expect(equal_files('file_name.bmp', 'line_graph.bmp')).to eq(true)
    end

    it 'creates a line graph with points marked' do
      a = Rubyplot::Figure.new
      a.line! @x1, @y1, markers: true
      a.save 'file_name.bmp'

      expect(equal_files('file_name.bmp', 'line_points_graph.bmp')).to eq(true)
    end
  end

  context '#scatter!' do
    it 'creates a simple scatter graph' do
      a = Rubyplot::Figure.new
      a.scatter! @x1, @y1
      a.save 'file_name.bmp'

      expect(equal_files('file_name.bmp', 'scatter_graph.bmp')).to eq(true)
    end
  end

  context "#bar!" do
    before do
      @x1 = (1..8).to_a
      @y1 = [3, 10, 7, 5, 3, 4.5, 6, 8.1]
      @width = 1/1.5
    end
    
    it "creates a simple bar graph" do
      a = Rubyplot::Figure.new
      a.bar! @x1, @y1, @width, color: :blue
      a.save 'file_name.bmp'

      expect(equal_files('file_name.bmp', 'simple_bar.bmp')).to eq(true)
    end
  end
end
