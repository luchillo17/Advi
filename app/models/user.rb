class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :confirmable, :omniauthable, :lockable

  has_many :user_experience
  has_many :experiences, through: :user_experience

  # Attach the Active Storage attachment for avatar image
  has_one_attached :avatar

  def self.all_with_experiences_avatars
    User
      .includes(:avatar_attachment)
      .includes(:experiences)
  end

  def self.find_by_experience(query_params)
    query_items_like = query_params.map { |query| "%#{query}%"}
    User.all_with_experiences_avatars
      .where("experiences.title ILIKE any (array [?])", query_items_like)
  end
end
