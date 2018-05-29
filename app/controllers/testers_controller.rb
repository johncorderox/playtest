class TestersController < ApplicationController
  def index
    @testers = Tester.all
  end

  def new
  end

  def create
    @playtest_id = params[:play_id]
    @new_tester = Tester.create(user_id: params[:user_id], play_id: params[:play_id])
    if @new_tester.save
      redirect_to_associated_playtest(@playtest_id)
    end
  end

  def show
  end

  def update
  end

  def destroy
    Tester.find(params[:id]).delete
    redirect_to :back
  end

end
