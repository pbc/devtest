class PanelProviderCalculatorFactory
  def self.price_calculator_for(panel_provider)
    calculator_instances = {
      :a_letters => Calculators::ALetterPriceCalculator, 
      :b_openning_tags => Calculators::BOpeningTagsCalculator, 
      :html_nodes => Calculators::HtmlNodesCalculator
    }
    calculator_type = panel_provider.price_calculator
    klass = calculator_instances[calculator_type]
    raise ArgumentError, "Invalid price calculator #{calculator_type}!" if klass.nil?
    klass.new(panel_provider)
  end
end