class WelcomeController < ApplicationController

  def index
    if current_user
    @user = current_user.role
    if @user == "tester"
      redirect_to playtests_path
     end
   end
 end
end
