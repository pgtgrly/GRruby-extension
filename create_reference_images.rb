require_relative './lib/grruby'

    x1 = [1, 2, 3, 4, 5]
    y1 = [10, 20, 30, 40, 50]
    values = [0, 24, -12, 48]
    freqwise = [1, 2, 5, 6, 5, 9, 9, 1, 2, 9, 2, 6, 5]
    portfolio_names = ['Apples', 'Oranges', 'Bananas']
    portfolio = [20000, 8000, 34000]

      a = Rubyplot::Figure.new
      a.line! x1, y1
      a.save 'spec/reference_images/single_plot_graph/line_graph.bmp'

      a = Rubyplot::Figure.new
      a.line! x1, y1, marker_size: 1
      a.save 'spec/reference_images/single_plot_graph/line_marker_graph.bmp'

      a = Rubyplot::Figure.new
      a.line! x1, y1, line_color: :red, line_type: :dashed
      a.save 'spec/reference_images/single_plot_graph/dash_line_marker_graph.bmp'

      a = Rubyplot::Figure.new
      a.scatter! x1, y1
      a.save 'spec/reference_images/single_plot_graph/scatter_graph.bmp'

      a = Rubyplot::Figure.new
      a.scatter! x1, y1, marker_color: :green, marker_size: 2,
                           marker_type: :diagonal_cross
      a.save 'spec/reference_images/single_plot_graph/scatter_cross_graph.bmp'

      a = Rubyplot::Figure.new
      a.bar! values
      a.save 'spec/reference_images/single_plot_graph/bar_graph.bmp'

      a = Rubyplot::Figure.new
      a.bar! values, bar_color: :red
      a.save 'spec/reference_images/single_plot_graph/red_bar_graph.bmp'

      a = Rubyplot::Figure.new
      a.bar! values, bar_color: :orange, bar_gap: 1
      a.save 'spec/reference_images/single_plot_graph/orange_spaced_bar_graph.bmp'



      bars_data = [[12, 4, 53, 24],
                    [4, 34, 8, 25],
                    [20, 9, 31, 2],
                    [56, 12, 84, 30]]

      a = Rubyplot::Figure.new
      a.stacked_bar! bars_data
      a.save 'spec/reference_images/single_plot_graph/stacked_bar_graph.bmp'


      a = Rubyplot::Figure.new
      a.stacked_bar! bars_data, bar_colors: [:black, :red, :green, :blue]
      a.save 'spec/reference_images/single_plot_graph/user_color_stacked_bar_graph.bmp'


      open = [10, 15, 24, 18]
      high = [20, 25, 30, 18]
      low = [5, 13, 15, 3]
      close = [15, 24, 18, 4]

      a = Rubyplot::Figure.new
      a.candlestick! open, high, low, close
      a.save 'spec/reference_images/single_plot_graph/candlestick_plot.bmp'

      a = Rubyplot::Figure.new
      a.candlestick! open, high, low, close, up_color: :blue, down_color: :black
      a.save 'spec/reference_images/single_plot_graph/candlestick_diff_color_plot.bmp'

      a = Rubyplot::Figure.new
      a.stacked_bar_z! bars_data
      a.save 'spec/reference_images/single_plot_graph/stacked_bar_z_graph.bmp'

      a = Rubyplot::Figure.new
      a.stacked_bar_z! bars_data, bar_colors: [:black, :red, :green, :blue]
      a.save 'spec/reference_images/single_plot_graph/user_color_stacked_bar_z_graph.bmp'

      x1 = [-10, 0, 5, 28]
      y1 = [1, 2, 3, 4]
      x2 = [2, 4, 16]
      y2 = [10, 20, -40]

      a = Rubyplot::Figure.new
      a.title 'My cool graph'
      a.line! x1, y1
      a.scatter! x2, y2
      a.save 'spec/reference_images/multi_plot_graph/line_scatter_graph.bmp'

    x1 = [1, 2, 3, 4, 5]
    y1 = [10, 20, 30, 40, 50]
    x2 = [2, 4, 16]
    y2 = [10, 20, -40]
    values = [0, 24, -12, 48]
    bars_data = [[12, 4, 53, 24],
                  [4, 34, 8, 25],
                  [20, 9, 31, 2],
                  [56, 12, 84, 30]]
    open = [10, 15, 24, 18]
    high = [20, 25, 30, 18]
    low = [5, 13, 15, 3]
    close = [15, 24, 18, 4]





      a = Rubyplot::Figure.new
      a.subplot!(2, 1, 1)
      a.line! x1, y1
      a.subplot!(2, 1, 2)
      a.scatter! x2, y2
      a.save 'spec/reference_images/subplots/two_vertical.bmp'




      a = Rubyplot::Figure.new
      a.subplot!(2, 2, 1)
      a.line! x1, y1, marker_size: 1
      a.scatter! x2, y2
      a.subplot!(2, 2, 2)
      a.scatter! x2, y2
      a.subplot!(2, 2, 3)
      a.line! x1, y1, line_color: :red, line_type: :dashed
      a.subplot!(2, 2, 4)
      a.candlestick! open, high, low, close, up_color: :blue, down_color: :black
      a.subplot!(2, 2, 3)
      a.bar! values, bar_color: :orange, bar_gap: 1
      a.save 'spec/reference_images/subplots/two_by_two_grid.bmp'
