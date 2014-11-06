require 'rails_helper'
describe Calculators::HtmlNodesCalculator do
  let(:panel_provider){double}
  let(:calculator){described_class.new(panel_provider)}

  describe "#calculate_price" do
    it "should return the number of html tags divided by 100" do 
      expect(calculator.calculate_price).to be > 0
    end
  end
end