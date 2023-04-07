class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy
  has_many_attached :images, dependent: :destroy
  has_one_attached :picture, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true

  def picture_as_thumbnail
    picture.variant(resize_to_limit: [200,200]).processed
  end  

  def images_as_thumbnails
    images.map do |image|
      image.variant(resize_to_limit: [150,150]).processed
    end
  end
end
