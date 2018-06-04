class CompanyController < ApplicationController
  def index
  end

  def aws
    @amazon = Amazon.first
    if @amazon.blank?
      Amazon.create(aws_update)
      redirect_to :back
    end
  end

  def edit
    @company = Company.last
    @amazon_check = Amazon.first
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

  def aws_update
    params.require(:aws).permit(:region, :bucket, :access_key_id, :secret_access_key)
  end

end
