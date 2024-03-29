class Genre < ApplicationRecord
  has_many :post_genres, dependent: :destroy
  has_many :posts, through: :post_genres
  belongs_to :customer,optional: true
end