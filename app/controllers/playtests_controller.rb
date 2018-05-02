class PlaytestsController < ApplicationController
  before_action :authenticate_user!

  def index
    @play = Play.all.order("id DESC")
    if @play.blank?
      @playtest_table_message = "No Playtests Created...."
    else
      @playtest_table_message = Play.count
    end
  end

  def new
  end

  def create
    @new_playtest = Play.create( name: params[:name], category: params[:category], description: params[:description], user_id: params[:user_id])
    redirect_to '/playtests'
  end

  def destroy
    @delete_playtest = Play.delete(params[:id])
    redirect_to '/playtests'
  end

  def edit
  end

  def update
  end

  def show
    @playtest = Play.find(params[:id])
  end

end
