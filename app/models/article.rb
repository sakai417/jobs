class Article < ActiveRecord::Base
  mount_uploader :image_url, ImageurlUploader
  belongs_to :user
  has_many :commentss, as: :commentable
end
