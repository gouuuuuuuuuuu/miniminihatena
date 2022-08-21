class Post < ApplicationRecord
  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :liked_customers, through: :likes, source: :customer
end
