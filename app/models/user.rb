class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    has_many :photos

    extend FriendlyId

    friendly_id :username, use: :slugged

    def should_generate_new_friendly_id?
        username_changed?
    end

    # def should_generate_new_friendly_id?
    #     new_record? || slug.nil? || slug.blank? # you can add more condition here
    # end

    validates :username,
        length: {  in: 0..24, allow_blank: false,
        allow_nil: false, message: "can't be blank" },  on: [:update]

    validates :username, uniqueness: true,  on: [:update]

    validates_presence_of :username, on: [:update]

    before_commit :set_username

    attr_accessor :full_name, :random_picked_photo

    def full_name
        "#{first_name} #{last_name}"
    end

    has_attached_file :avatar,
                      styles: {
                          medium: '300x300>',
                          thumb: '100x100>'
                      },
                      storage: :s3,
                      s3_credentials: proc { |a| a.instance.s3_credentials },
                      s3_protocol: :https,
                      default_url: 'https://i.imgur.com/pqpsxlQ.png',
                      url: '/users/:attachment/:id/:style/:filename'
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

    def s3_credentials
        {
            bucket: ENV.fetch('S3_BUCKET_NAME'),
            access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID').to_s,
            secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY').to_s,
            s3_region: ENV.fetch('AWS_REGION').to_s,
            endpoint: ENV.fetch('AWS_S3_ENDPOINT').to_s
        }
    end

    def random_picked_photo
        offset = rand(photos.count)
        # Rails 4
        Photo.offset(offset).first
    end

    def set_username
        self.username = "#{email.split('@')[0]}#{SecureRandom.urlsafe_base64(5)}".downcase
        self.slug = self.username.downcase
    end
end
