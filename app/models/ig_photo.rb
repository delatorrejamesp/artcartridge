class IgPhoto #< ApplicationRecord



  def self.instagram_photos(count=7)
    require "net/https"
    require "uri"

    uri = URI.parse("https://api.instagram.com/v1/users/self/media/recent/?access_token=#{ENV['IG_ACCESS_TOKEN']}&&count=#{count}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(uri.request_uri)

    response = http.request(request)
    JSON.parse(response.body)["data"]
    #response.body
    #response.status
    #response# All headers are lowercase
  end

  def self.auth
    uri = URI.parse("https://api.instagram.com/oauth/authorize/?client_id=e07914c8ff3647a8bb2470f22deb67c8&redirect_uri=http://localhost:3000/&response_type=token")
    #logger.info "#{uri}"
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(uri.request_uri)

    response = http.request(request)
    #JSON.parse(response.body)["data"]
  end

  def self.media_comments(id)
    require "net/https"
    require "uri"



    uri = URI.parse("https://api.instagram.com/v1/media/#{id}/comments?access_token=#{ENV['IG_ACCESS_TOKEN']}&count=7&scope=public_content+comments")
    #logger.info "#{uri}"
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(uri.request_uri)

    response = http.request(request)
    JSON.parse(response.body)["data"]
  end
end
