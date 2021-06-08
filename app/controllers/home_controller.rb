class HomeController < ApplicationController
  def index
    @query = experience_query['q'] || []

    if @query.respond_to?(:empty?) && !@query.empty?
      @users = User.find_by_experience @query
      return
    end

    @users = User.all
  end

  private

  def experience_query
    params.permit(:locale, q: [])
  end
end
