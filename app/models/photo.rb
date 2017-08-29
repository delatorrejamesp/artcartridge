class Photo < ApplicationRecord

  belongs_to :user

   has_and_belongs_to_many :tools

  acts_as_commontator
  acts_as_commontable

  acts_as_votable


  #validates :image, presence: true, allow_blank: false
  validates :title, presence: true, allow_blank: false


  has_attached_file :image,
    styles: {
       medium: "300x300>",
       thumb: "100x100>"
     },
    :storage => :s3,
    :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
    :s3_protocol => :https,
    default_url: "http://www.mesitiko-athens.gr/images/no_photo_large.png",
    url: "/photos/:attachment/:id/:style/:filename"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

    def s3_credentials
      {
        :bucket => ENV.fetch("S3_BUCKET_NAME"),
        :access_key_id => "#{ENV.fetch("AWS_ACCESS_KEY_ID")}",
        :secret_access_key => "#{ENV.fetch("AWS_SECRET_ACCESS_KEY")}",
        :s3_region => "#{ENV.fetch("AWS_REGION")}",
        :endpoint => "#{ENV.fetch("AWS_S3_ENDPOINT")}",
      }
    end

end
