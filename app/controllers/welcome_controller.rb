class WelcomeController < ApplicationController

  def index
    @user = current_user.role
    if @user == "tester"
      redirect_to playtests_path
     end
   end
end
