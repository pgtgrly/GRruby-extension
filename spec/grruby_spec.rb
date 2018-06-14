require './lib/grruby'
require 'rmagick'
include Magick

system 'mkdir', '-p', 'spec/tmp'
RSpec.describe GR do 
  describe ".version" do
    it 'returns the version of GR Framework' do
      expect(described_class.version()).to eql('0.31.1')
    end
  end
end

system 'rm', '-rf', 'spec/tmp'