class User < ApplicationRecord
  validates :email, presence: true
  has_many :visits, class_name: "Ahoy::Visit"
end
