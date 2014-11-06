require 'open-uri'
module Calculators
  class BOpeningTagsCalculator < BasePriceCalculator
    def calculate_price
      content = open('https://ajax.googleapis.com/ajax/services/feed/find?v=1.0&q=news').read
      total_number = count_number_of_b_tags(JSON(content))      
      total_number
    end

    private
    def count_number_of_b_tags(json)
      count ||= 0
      json.each do |key, value|
        if value.is_a?(Array)
          value.each do |value|
            count += count_number_of_b_tags(value)
          end
        elsif value.is_a?(Hash)
          count += count_number_of_b_tags(value)
        elsif value.is_a?(String)          
          count += value.scan(/<b>/).count
        end
      end
      count      
    end
  end
end