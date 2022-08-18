class Customer < ApplicationRecord
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest
    find_or_create_by!(email: 'guest@1111.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
    end
  end

  has_many :posts, dependent: :destroy
  has_many :comments
end

