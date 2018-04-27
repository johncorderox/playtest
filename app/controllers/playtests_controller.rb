class PlaytestsController < ApplicationController
  def index
    @play = Play.all
  end

  def new
  end

  def create
    @new_playtest = Play.create( name: params[:name], category: params[:category], description: params[:description], user_id: params[:user_id])
    redirect_to '/playtests'
  end

  def destroy
  end

  def edit
  end

  def update
  end

end
