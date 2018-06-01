class PlaytestsController < ApplicationController
  before_action :authenticate_user!

  def closeapp
    @close = Play.find(params[:playtest_id]).update(status: "In Process")
    redirect_to :back
  end

  def openapp
    @open = Play.find(params[:playtest_id]).update(status: "Open")
    redirect_to :back
  end

  def index
    @play = Play.all.order("id DESC")
    if @play.blank?
      @playtest_table_message = "No Playtests Created...."
    else
      @playtest_table_message = Play.count
    end
  end

  def new
  end

  def create
    @new_playtest = Play.create(name: params[:name], category: params[:category], description: params[:description], user_id: params[:user_id])
    redirect_to root_path
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
  end

  def notes
    @playtest_id = Play.find(params[:id])
    if @playtest_id
      @playtest_id.update(update_notes)

      @name_of_playtest = @playtest_id.name.parameterize('_')
      new_notes_file = File.new("public/notes/playtest_#{@name_of_playtest}.txt", "w")
      new_notes_file.puts(@playtest_id.notes)
      new_notes_file.close

      #
       s3 = Aws::S3::Resource.new(region: 'us-west-2')
      #
      # my_bucket = s3.bucket("playtest88")
      # my_bucket.create

      file = "public/notes/playtest_#{@name_of_playtest}.txt"
      bucket = 'playtest88'

      name = File.basename(file)

      obj = s3.bucket(bucket).object(name)

      obj.upload_file(file)

      redirect_to :back
    else
      redirect_to :back
    end
  end

  private

  def update_notes
    params.require(:notes).permit(:notes)
  end
end
