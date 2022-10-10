class Customer < ApplicationRecord
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest
    find_or_create_by!(email: 'guest@1111.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.first_name_kana = 'ゲスト'
      customer.last_name_kana = 'タラオ'
    end
  end

  has_many :posts, dependent: :destroy
  has_many :comments
   has_many :genres, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ , message: 'はカタカナで入力して下さい。'}
  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ , message: 'はカタカナで入力して下さい。'}
  
   validates :nickname, {presence: true, length: {maximum: 15}}
  
  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
end

