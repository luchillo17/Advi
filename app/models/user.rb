class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :confirmable, :omniauthable, :lockable

  has_many :user_experience
  has_many :experiences, through: :user_experience

  def self.find_by_experience(query_params)
    query_items_like = query_params.map { |query| "%#{query}%"}
    User.joins(:experiences).where("experiences.title ILIKE any (array [?])", query_items_like)
  end
end
