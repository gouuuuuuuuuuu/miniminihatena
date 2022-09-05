class Post < ApplicationRecord
  belongs_to :customer
  belongs_to :genre
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_customers, through: :likes, source: :customer

  validates :body, {presence: true, lengh: {maximum: 2}}

  has_one_attached :post_image

  def get_post_image
    unless post_image.attached?
      file_path = Rails.root.join('app/assets/images/desert.jpg')
      post_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    post_image
  end
end
