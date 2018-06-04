class Play < ApplicationRecord

  belongs_to :user

  # Before creating a new playtest, status will be 'open'
  before_create :default_status_new

  # Before creating a new platest, a unique access code will generate
  # Access codes are used for applying to new playtests.
  before_create :new_access_code

  # Before creating a new playtest, create the default folder for admin notes
  before_create :create_notes_folder

  # Before creating a new playtest, a log will be recorded
  before_create :create_playtest_log

  # Before creating a new playtest, create a success message
  before_create :success_playtest_log

  # Before destroying a playtest, a log is recorded
  before_destroy :delete_playtest_log

  # After destroying a playtest, a log is recorded
  after_destroy :delete_playtest_message

  # This function will generate a new access code
  def generate_access_code
    @new_access_code = rand(1...999999).to_s
    @new_access_code << "_TEST"
  end


  private
    def default_status_new
      self.status = "Open"
    end

    def new_access_code
      create_notes_folder

      generate_access_code

      database_check = Play.find_by(access_code: @new_access_code)

      if database_check.blank?
        self.access_code = @new_access_code
      else
        generate_access_code
      end
    end

    def create_notes_folder
      Dir.mkdir 'public/notes' unless File.directory?('public/notes')
    end

    def create_playtest_log
      Log.create(description: "User attempted to create a new playtest",
        error_code: 200, status: "PASS")
    end

    def success_playtest_log
      Log.create(description: "A Playtest was created successfully", error_code: 201,
      status: "Success")
    end

    def delete_playtest_log
      Log.create(description: "A User attempted to delete a playtest", error_code: 200,
      status: "PASS")
    end

    def delete_playtest_message

      if self.user.role == "admin"
        desc = "A Playtest has been deleted successfully"
        ec = 201
        stat = "Success"
      elsif self.user.role == "tester"
        desc = "A   tester tried to delete a playtest and failed."
        ec = 401
        stat = "Warning"
      else
        desc = "An unknown account tried to delete a playtest and failed."
        ec = 401
        stat = "Warning"
      end
        Log.create(description: desc, error_code: ec,
        status: stat)
      end
 end
