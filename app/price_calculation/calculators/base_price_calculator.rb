module Calculators
  class BasePriceCalculator
    def initialize(panel_provider)
      @panel_provider = panel_provider
    end
    def calculate_price
      raise NotImplementedError, "This method must be overrided in subclasses!"
    end
  end
end