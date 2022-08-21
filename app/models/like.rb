class Like < ApplicationRecord
  belongs_to :post
  belongs_to :customer
   validates_uniqueness_of :post_id, scope: :customer_id
end
