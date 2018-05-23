gem "minitest"
require "minitest/autorun"
require "grruby"

class TestGrruby < Minitest::Test
  def test_sanity
    flunk "write tests or I will kneecap you"
  end
end
