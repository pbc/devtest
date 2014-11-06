require 'open-uri'

module Calculators
  class ALetterPriceCalculator < BasePriceCalculator
    def calculate_price
      # TODO: the first parts should go to other objects 
      # to separate the logic of retrieving and parsing 
      # site data
      html = open('http://www.time.com').read
      nokogiri_document = Nokogiri::HTML(html)
      nokogiri_document.css('script').remove
      nokogiri_document.css('stylesheet').remove
      document = nokogiri_document.text.strip
      number_of_letters_a = document.scan(/a/).count
      number_of_letters_a.to_f / 100
    end
  end
end