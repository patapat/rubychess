require "spec_helper"


module Chess
  describe Tile do

    context "#initialize" do
      it "is initialized with a value of '' by default" do
        cell = Tile.new
        expect(cell.value).to eq ''
      end

      
    end
  end
end
