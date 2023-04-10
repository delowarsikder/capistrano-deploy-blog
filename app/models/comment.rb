class Comment < ApplicationRecord
  include Visible
  validates :commenter ,presence: true
  validates :body , presence: true


  belongs_to :article
end
