class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :confirmable, :omniauthable, :lockable

  has_many :user_experience
  has_many :experiences, through: :user_experience

  def self.find_by_experience(q)
    User.joins(:experiences).where("experiences.title LIKE ?", "%#{q}%")
  end
end
