class Comment < ApplicationRecord
  belongs_to :post
end

# has_one :user, through: :post
