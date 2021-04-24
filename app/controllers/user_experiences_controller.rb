class UserExperiencesController < ApplicationController
  before_action :set_user_experience, only: %i[ show edit update destroy ]

  # GET /user_experiences or /user_experiences.json
  def index
    @user_experiences = UserExperience.all
  end

  # GET /user_experiences/1 or /user_experiences/1.json
  def show
  end

  # GET /user_experiences/new
  def new
    @user_experience = UserExperience.new
  end

  # GET /user_experiences/1/edit
  def edit
  end

  # POST /user_experiences or /user_experiences.json
  def create
    @user_experience = UserExperience.new(user_experience_params)

    respond_to do |format|
      if @user_experience.save
        format.html { redirect_to @user_experience, notice: "User experience was successfully created." }
        format.json { render :show, status: :created, location: @user_experience }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_experiences/1 or /user_experiences/1.json
  def update
    respond_to do |format|
      if @user_experience.update(user_experience_params)
        format.html { redirect_to @user_experience, notice: "User experience was successfully updated." }
        format.json { render :show, status: :ok, location: @user_experience }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_experiences/1 or /user_experiences/1.json
  def destroy
    @user_experience.destroy
    respond_to do |format|
      format.html { redirect_to user_experiences_url, notice: "User experience was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_experience
      @user_experience = UserExperience.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_experience_params
      params.require(:user_experience).permit(:user_id, :experience_id, :expertise_time)
    end
end
