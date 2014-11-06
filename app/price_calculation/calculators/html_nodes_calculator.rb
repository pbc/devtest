require 'open-uri'
module Calculators
  class HtmlNodesCalculator < BasePriceCalculator
    def calculate_price
      html = open('http://www.time.com').read
      nokogiri_document = Nokogiri::HTML(html)
      nodes = []
      nokogiri_document.traverse do |node|
        nodes << node 
      end
      nodes.select{|x| x.is_a?(Nokogiri::XML::Element)}.count / 100.to_f
    end
  end
end