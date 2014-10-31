class PanelProvider < ActiveRecord::Base
  has_many :countries

  def price
    #TODO find a better method (maybe add a type) for pricing logic
    if id == 1
      make_request = MakeRequest.new("http://time.com")
      make_request.perform
      make_request.response.scan("a").count / 100
    elsif id == 2
      make_request = MakeRequest.new("https://ajax.googleapis.com/ajax/services/feed/find?v=1.0&q=news")
      make_request.perform
      make_request.response.scan("\\u003cb\\u003e").count
    else
      nr = 0
      make_request = MakeRequest.new("http://time.com")
      make_request.perform
      Nokogiri::HTML(make_request.response).traverse{|node| nr+=1 } / 100
    end
  end
end
