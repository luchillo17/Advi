class UserExperience < ApplicationRecord
  belongs_to :user
  belongs_to :experience

  validates_associated :user, :experience
end
