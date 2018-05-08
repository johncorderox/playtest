class ApplicationsController < ApplicationController
  def index
  end

  def new
    @user = current_user
    @codes = Play.all.order("id DESC")
  end

  def create
    @new_application = Application.new(submit_app)
    if @new_application.save
      redirect_to applications_path
    else
      redirect_to :back
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private

  def submit_app
    params.require(:app).permit(:user_id, :play_id, :answerwhy, :experience, :qa,
      :favoritegame, :message)
  end

end
