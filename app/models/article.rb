class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy
  has_many_attached :images, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true
end
