class HomeController < ApplicationController
  def index
    puts experience_query
    return @users = User.all if experience_query["q"].nil? || experience_query["q"].empty?

    @users = User.find_by_experience experience_query["q"]
    puts @users
  end

  private
  
  def experience_query
    params.permit(:q)
  end
end
