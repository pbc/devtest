require 'rails_helper'
describe Calculators::BOpeningTagsCalculator do
  let(:panel_provider){double}
  let(:calculator){described_class.new(panel_provider)}

  describe "#calculate_price" do
    it "should return the number of openning tags with B" do 
      expect(calculator.calculate_price).to be > 0
    end
  end
end