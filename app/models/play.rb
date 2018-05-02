class Play < ApplicationRecord
  belongs_to :user

  # Before creating a new playtest, status will be 'open'
  before_create :default_status_new

  # Before creating a new platest, a unique access code will generate
  # Access codes are used for applying to new playtests.
  before_create :new_access_code

  # This function will generate a new access code

  def generate_access_code
    @new_access_code = rand(1...999999).to_s
    @new_access_code << "TEST"
  end

  private
    def default_status_new
      self.status = "Open"
    end

    def new_access_code

      generate_access_code

      database_check = Play.find_by(access_code: @new_access_code)

      if database_check.blank?
        self.access_code = @new_access_code
      else
        generate_access_code
      end
    end


end
