class Experience < ApplicationRecord
  has_many :users, through: :user_experience

  validates :title, presence: true, length: { minimum: 3 }, uniqueness: true
end
