class Play < ApplicationRecord
  belongs_to :user

  # Before creating a new playtest, status will be 'open'
  before_create :default_status_new

  # Before creating a new platest, a unique access code will generate
  # Access codes are used for applying to new playtests.
  before_create :new_access_code

  private
    def default_status_new
      self.status = "Open"
    end

    def new_access_code
      new_access_code = rand(1...999999).to_s
      new_access_code << "TEST"

      database_check = Play.find_by(access_code: new_access_code)

        self.access_code = new_access_code

    end


end
