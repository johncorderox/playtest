class Application < ApplicationRecord
  belongs_to :user
  belongs_to :play

  # Before a new application is made, a status of new is generated
  before_create :add_new_to_application_status

  private

  def add_new_to_application_status
    self.status = "New"
  end

end
