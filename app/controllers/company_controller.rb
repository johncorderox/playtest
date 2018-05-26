class CompanyController < ApplicationController
  def index
  end

  def edit
    @company = Company.last
  end

  def show
  end

  def create
  end

  def update
     Company.update(company_change)
     redirect_to :back
  end

  def destroy
  end

  def destroy_all_playtests
    Play.delete_all
    redirect_to company_path
  end

  private

  def company_change
     params.require(:company).permit(:name)
  end

end
