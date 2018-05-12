class TestersController < ApplicationController
  def index
  end

  def new
  end

  def create
    @playtest_id = params[:play_id]
    @new_tester = Tester.create(user_id: params[:user_id], play_id: params[:play_id])
    if @new_tester.save
      redirect_to '/playtests/'+ "#{@playtest_id}"
    end
  end

  def show
  end

  def update
  end

  def destroy
  end

end
