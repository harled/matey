class User < ApplicationRecord
  validates :email, presence: true
end
