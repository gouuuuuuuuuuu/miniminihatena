class Post < ApplicationRecord
  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_customers, through: :likes, source: :customer
  has_many :post_genres, dependent: :destroy
  has_many :genres, through: :post_genres

  validates :body, {presence: true, length: {maximum: 1000}}

  has_one_attached :post_image

  def get_post_image
    unless post_image.attached?
      file_path = Rails.root.join('app/assets/images/desert.jpg')
      post_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    post_image
  end
end
