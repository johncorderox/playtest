class WelcomeController < ApplicationController

  def index
    if current_user
    @user = current_user.role
    if @user == "admin"
      redirect_to playtests_path
    else
      redirect_to '/applications/new'
     end
   end
 end
end
