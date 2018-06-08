class ApplicationsController < ApplicationController
  def index
  end

  def new
    @user = current_user
    @applied_applications = Application.where()
    @codes = Play.all.order("id DESC").where(status: "Open")
  end

  def create
    @new_application = Application.new(submit_app)
    if @new_application.save
      redirect_to root_path
    else
      redirect_to :back
    end
  end

  def edit
  end

  def update
  end

  def show
    @show_application = Application.find(params[:id])
  end

  def destroy
    @playtest_id = Application.find(params[:id]).play_id
    Application.find(params[:id]).update(status: "Rejected")
    redirect_to_associated_playtest(@playtest_id)
  end

  private

  def submit_app
    params.require(:app).permit(:user_id, :play_id, :answerwhy, :experience, :qa,
      :favoritegame, :genre, :message)
  end

end
