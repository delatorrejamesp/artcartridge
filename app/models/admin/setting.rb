class Admin::Setting < ApplicationRecord


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

end
