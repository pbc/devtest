module Calculators
  class BasePriceCalculator
    def calculate_price
      raise NotImplementedError, "This method must be overrided in subclasses!"
    end
  end
end