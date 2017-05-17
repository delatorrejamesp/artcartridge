class Admin::Setting < ApplicationRecord

  has_many :qoutes
  has_attached_file :logo,
                    styles: {
                        medium: '300x300>',
                        thumb: '100x100>'
                    },
                    storage: :s3,
                    s3_credentials: proc { |a| a.instance.s3_credentials },
                    s3_protocol: :https,
                    default_url: 'https://i.imgur.com/pqpsxlQ.png',
                    url: '/users/:attachment/:id/:style/:filename'
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

  def s3_credentials
      {
          bucket: ENV.fetch('S3_BUCKET_NAME'),
          access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID').to_s,
          secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY').to_s,
          s3_region: ENV.fetch('AWS_REGION').to_s,
          endpoint: ENV.fetch('AWS_S3_ENDPOINT').to_s
      }
  end

  def instagram_photos
    require "net/https"
    require "uri"

    uri = URI.parse("https://api.instagram.com/v1/users/self/media/recent/?access_token=3610118340.e07914c.aa06863d6ee54a7c9adf8fc0a12bf664&&count=7")
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

  def qoutes_random
      qoutes.limit(10).order("RANDOM()")
  end

end
