require 'spec_helper'

describe Rubyplot do
  describe GR do
    describe Tasks do
      context BeginPrint do
        it "creates a beginprint task" do
          t = Rubyplot::GR::Tasks::BeginPrint.new "new_file.bmp"

          expect(t.file_name).to eq("new_file.bmp")
          expect(t.call).to eq(true)
        end
      end
    end
  end
end
