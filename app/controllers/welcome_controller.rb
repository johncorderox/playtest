class WelcomeController < ApplicationController
  def index
  end
  def applications
    @user = User.find(current_user)
    puts "#{@user.id}"
    puts "#{params[:id]}"
    if @user.id.to_s == params[:id]
       @codes = Play.all
    else
      redirect_to root_path
    end
  end
  def submitApplication
  end
end
