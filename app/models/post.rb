class Post < ApplicationRecord
  belongs_to :customer
  has_many :comments, dependent: :destroy
end
