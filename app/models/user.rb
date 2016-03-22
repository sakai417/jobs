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
                    :storage => :s3,
                    :s3_permissions => :public,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :path => ":attachment/:id/:style.:extension"
  validates_attachment_content_type :avatar,        content_type: ["image/jpg","image/jpeg","image/png"]
  # do_not_validate_attachment_file_type :image


  validates :nickname, :job, presence: true

  has_many :articles
  has_many :tweets
  has_many :comments

end
