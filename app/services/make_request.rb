class MakeRequest
  attr_reader :response

  def initialize(url)
    @url = url
  end

  def perform
    uri = URI(@url)
    http = Net::HTTP.new(uri.host, uri.port)

    if uri.scheme == "https"
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end

    request = Net::HTTP::Get.new(uri.request_uri)
    resp = http.request(request)
    @response = resp.body
  end

end
