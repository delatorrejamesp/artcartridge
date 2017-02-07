class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :photos

  extend FriendlyId
  friendly_id :username, use: :slugged

  validates :username, uniqueness: true

  attr_accessor :full_name, :random_picked_photo

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  has_attached_file :avatar,
    styles: {
       medium: "300x300>",
       thumb: "100x100>"
     },
    :storage => :s3,
    :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
    :s3_protocol => :https,
    default_url: "https://i.imgur.com/pqpsxlQ.png",
    url: "/users/:attachment/:id/:style/:filename"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

    def s3_credentials
      {
        :bucket => ENV.fetch("S3_BUCKET_NAME"),
        :access_key_id => "#{ENV.fetch("AWS_ACCESS_KEY_ID")}",
        :secret_access_key => "#{ENV.fetch("AWS_SECRET_ACCESS_KEY")}",
        :s3_region => "#{ENV.fetch("AWS_REGION")}",
        :endpoint => "#{ENV.fetch("AWS_S3_ENDPOINT")}",
      }
    end

   def random_picked_photo
     offset = rand(self.photos.count)
      # Rails 4
      return Photo.offset(offset).first
   end
end
