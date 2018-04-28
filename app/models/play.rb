class Play < ApplicationRecord
  belongs_to :user

  # Before creating a new playtest, status will be 'open'
  before_create :default_status_new

  private
    def default_status_new
      self.status = "Open"
    end

end
