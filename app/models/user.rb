class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         # , :confirmable

  has_attached_file :avatar,
                    styles:  {
                      medium: "300x300#",
                      thumb: "100x100#",
                    },
                    storage: :fog,
                    fog_credentials: {
                      aws_access_key_id: Settings.jobs[:aws_access_key_id],
                      aws_secret_access_key: Settings.jobs[:aws_secret_access_key],
                      region: Settings.jobs[:region],
                      provider: 'AWS',
                      scheme: 'https'
                    },
                    fog_directory: 'jobs-image',
                    path: 'uploads/user/avatar/:id/:hash_:style.:extension',
                    hash_secret: ENV['SECRET_KEY_BASE']
  validates_attachment_content_type :avatar,        content_type: ["image/jpg","image/jpeg","image/png"]
  # do_not_validate_attachment_file_type :image


  validates :nickname, :job, presence: true

  has_many :articles
  has_many :tweets
  has_many :comments

end
