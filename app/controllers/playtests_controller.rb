class PlaytestsController < ApplicationController
  before_action :authenticate_user!

  def closeapp
    @close = Play.find(params[:playtest_id]).update(status: "In Process")
    Log.create(description: "Playtest ID: #{params[:playtest_id]} was marked In Process", error_code: 200, status: "PASS")
    redirect_to :back, notice: "This Playtest Is No Longer Accepting Applications."
  end

  def openapp
    @open = Play.find(params[:playtest_id]).update(status: "Open")
    Log.create(description: "Playtest ID: #{params[:playtest_id]} was marked open", error_code: 200, status: "PASS")
    redirect_to :back, notice: "This Playtest Is Now Accepting Applications."
  end

  def index
    @play = Play.all.order("id DESC")
    if @play.blank?
      @playtest_table_message = "No Playtests Created...."
    else
      @playtest_table_message = Play.count
    end
  end

  def create
    @new_playtest = Play.create(name: params[:name], category: params[:category], description: params[:description], user_id: params[:user_id])
    redirect_to root_path
  end

  def new
  end

  def backup
    @company = Company.first
    @playtest = Play.find(params[:id])
    @testers = Tester.joins(:user).where(play_id: params[:id]).select("name")

    @full_name_of_playtest = @playtest.name.parameterize('_')
    full_new_notes_file = File.new("public/notes/full_playtest_#{@full_name_of_playtest}.txt", "w")
    full_new_notes_file.puts("----------------")
    full_new_notes_file.puts(@playtest.name)
    full_new_notes_file.puts("----------------")
    full_new_notes_file.puts("Access Code: #{@playtest.access_code}")
    full_new_notes_file.puts("Created On: #{@playtest.created_at}")
    full_new_notes_file.puts("Description: #{@playtest.description}")
    full_new_notes_file.puts("----------------")
    @testers.each_with_index do |x, index|
      full_new_notes_file.puts("#{index + 1} - #{x.name}")
    end
    full_new_notes_file.puts("----------------")
    full_new_notes_file.puts("Notes: #{@playtest.notes}")
    full_new_notes_file.close

    Log.create(description: "Backup File Successful for playtest: #{@playtest.name}", error_code: 200, status: "Success")
    redirect_to :back, notice: "Full Playtest Backup Created"
  end

  def destroy
    @delete_playtest = Play.destroy(params[:id])
    redirect_to '/playtests'
  end

  def edit
  end

  def update
  end

  def show
    @playtest = Play.find(params[:id])
    @applications = Application.where(play_id: params[:id]).where(status: "New")
    @applications_rejected = Application.where(play_id: params[:id]).where(status: "Rejected")
    @testers = Tester.where(play_id: params[:id])
    @user = User.where(role: "admin")
  end

  def notes
    @playtest_id = Play.find(params[:id])
    if @playtest_id
      @playtest_id.update(update_notes)

      @name_of_playtest = @playtest_id.name.parameterize('_')
      new_notes_file = File.new("public/notes/playtest_#{@name_of_playtest}.txt", "w")
      new_notes_file.puts(@playtest_id.notes)
      new_notes_file.close

      file = "public/notes/playtest_#{@name_of_playtest}.txt"


      @amazon = Amazon.first

      Aws.config.update({credentials: Aws::Credentials.new(
        @amazon.access_key_id, @amazon.secret_access_key)})

      s3 = Aws::S3::Resource.new(region: 'us-west-2')

      name = File.basename(file)

      obj = s3.bucket(@amazon.bucket).object(name)

      obj.upload_file(file)

      Log.create(description: "Notes were successfully sent to AWS S3!", error_code: 200, status: "Saved")

      redirect_to :back
    else
      redirect_to :back
    end
  end

  def owner
    @change_owner = Play.find(params[:id]).update(change_playtest_owner)
    redirect_to :back, notice: "The Owner Of This Playtest Has Been Updated"
  end

  private

  def update_notes
    params.require(:notes).permit(:notes)
  end

  def change_playtest_owner
    params.require(:owner).permit(:user_id)
  end
end
