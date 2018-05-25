class CompanyController < ApplicationController
  def index
  end

  def edit
  end

  def show
  end

  def create
  end

  def update
     @company.update(company_change)
  end

  def destroy
  end

  def destroy_all_playtests
    Play.delete_all
    redirect_to company_path
  end

  private

  def company_change
     params.require(:company).permit(:company)
  end

end
