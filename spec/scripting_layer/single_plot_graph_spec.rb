require 'spec_helper'

describe Rubyplot::Figure do
  before do
    @x1 = [1, 2, 3, 4, 5]
    @y1 = [10, 20, 30, 40, 50]
    @values = [0,24,-12.48]
    @freqwise = [1,2,5,6,5,9,9,1,2,9,2,6,5]
    @portfolio_names = ['Apples','Oranges','Bananas']
    @portfolio = [20000,8000,34000]
  end

  context '#line' do
    it 'creates a simple line graph' do
      a = Rubyplot::Figure.new
      a.line! @x1, @y1
      a.save 'file_name.bmp'

      expect(equal_files('file_name.bmp', 'line_graph.bmp')).to eq(true)
    end

    it 'creates a line graph with points marked' do
      a = Rubyplot::Figure.new
      a.line! @x1, @y1, marker_size: 1
      a.save 'file_name.bmp'

      expect(equal_files('file_name.bmp', 'line_marker_graph.bmp')).to eq(true)
    end

    it 'creates a red dashed line graph with points marked' do
      a = Rubyplot::Figure.new
      a.line! @x1, @y1, line_color: :red, line_type: :dashed
      a.save 'file_name.bmp'

      expect(equal_files('file_name.bmp', 'dash_line_marker_graph.bmp')).to eq(true)
    end
  end

  context '#scatter' do
    it 'creates a simple scatter graph' do
      a = Rubyplot::Figure.new
      a.scatter! @x1, @y1
      a.save 'file_name.bmp'

      expect(equal_files('file_name.bmp', 'scatter_graph.bmp')).to eq(true)
    end

    it 'creates a green cross scatter graph' do
      a = Rubyplot::Figure.new
      a.scatter! @x1, @y1, marker_color: :green, marker_size: 2,
                           marker_type: :diagonal_cross

      a.save 'file_name.bmp'

      expect(equal_files('file_name.bmp', 'scatter_cross_graph.bmp')).to eq(true)
    end
  end


  context '#bar' do
    it 'creates a simple bar graph' do
      a = Rubyplot::Figure.new
      a.bar! @values
      a.save 'file_name.bmp'

      expect(equal_files('file_name.bmp', 'bar_graph.bmp')).to eq(true)
    end

    it 'creates a bar graph with red color bars' do
      a = Rubyplot::Figure.new
      a.bar! @values, bar_color: :red
      a.save 'file_name.bmp'

      expect(equal_files('file_name.bmp', 'red_bar_graph.bmp')).to eq(true)
    end

    it 'creates a bar graph with blue color bars with spaces' do
      a = Rubyplot::Figure.new
      a.bar! @values, bar_color: :blue
      a.save 'file_name.bmp'

      expect(equal_files('file_name.bmp', 'blue_spaced_bar_graph.bmp')).to eq(true)
    end
  end

  context '#line_plot' do
    it 'creates a simple line plot' do
      a = Rubyplot::Figure.new
      a.line_plot! @freqwise
      a.save 'file_name.bmp'

      expect(equal_files('file_name.bmp', 'line_plot.bmp')).to eq(true)
    end

    it 'creates a line plot with red markers' do
      a = Rubyplot::Figure.new
      a.line_plot! @values, marker_color: :red, marker_size: 2
      a.save 'file_name.bmp'

      expect(equal_files('file_name.bmp', 'red_line_plot.bmp')).to eq(true)
    end

    it 'creates a line plot with green solid bowtie markers' do
      a = Rubyplot::Figure.new
      a.bar! @values, marker_color: :green, marker_type: :solid_bowtie
      a.save 'file_name.bmp'

      expect(equal_files('file_name.bmp', 'green _bowtie_line_plot.bmp')).to eq(true)
    end
  end

  context '#pie!' do
    it 'creates a simple pie chart' do
      a = Rubyplot::Figure.new
      a.pie! @portfolio @portfolio_names
      a.save 'file_name.bmp'
    end
  end
end
