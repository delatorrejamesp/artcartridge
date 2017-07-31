class IgPhoto #< ApplicationRecord

#

  def self.instagram_photos(count=7)
    require "net/https"
    require "uri"

    uri = URI.parse("https://api.instagram.com/v1/users/self/media/recent/?access_token=3610118340.e07914c.aa06863d6ee54a7c9adf8fc0a12bf664&&count=#{count}")
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

  def self.media_comments(id)
    require "net/https"
    require "uri"

    uri = URI.parse("https://api.instagram.com/v1/media/#{id}/comments?access_token=3610118340.e07914c.aa06863d6ee54a7c9adf8fc0a12bf664&&count=7")
    logger.info "#{uri}"
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(uri.request_uri)

    response = http.request(request)
    JSON.parse(response.body)["data"]
  end
end
