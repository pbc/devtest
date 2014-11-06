describe PanelProviderCalculatorFactory do
  describe "PanelProviderCalculatorFactory#price_calculator_for" do
    let(:panel_provider){double("PanelProvider")}

    it "should raise ArgumentError when the calculator is not implemented" do 
      allow(panel_provider).to receive(:price_calculator).and_return(:some_unexistent_calculator)
      expect{described_class.price_calculator_for(panel_provider)}.to raise_error ArgumentError
    end
  end
end