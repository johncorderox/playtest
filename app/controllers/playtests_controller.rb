class PlaytestsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @new_playtest = Playtest.new(playtest)
    if @new_playtest.save
      redirect_to '/playtests'
    else
      redirect_to :back
      #flash[:alert] = "All Fields Are Required!"
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private
    def playtest
      params.require(:playtest).permit()
    end
end
