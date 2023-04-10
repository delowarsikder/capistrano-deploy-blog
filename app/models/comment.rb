class Comment < ApplicationRecord
  include Visible
<<<<<<< HEAD
  validates :commenter ,presence: true
  validates :body , presence: true


  belongs_to :article
=======

  belongs_to :article
  validates :commenter, presence: true
  validates :body, presence: true

>>>>>>> development
end
