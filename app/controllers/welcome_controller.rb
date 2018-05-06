class WelcomeController < ApplicationController
  def index
  end
  def applications
    @user = User.find(current_user)
    if @user.id.to_s == params[:id]
       @codes = Play.all
    else
      redirect_to root_path
    end
  end
  def submitApplication
    @new_application = Application.new(submit_app)
    if @new_application.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  private

  def submit_app
    params.require(:app).permit(:user_id, :play_id, :answerwhy, :experience, :qa,
      :favoritegame, :message)
  end
end
