class Experience < ApplicationRecord
  has_many :users, through: :user_experience
end
