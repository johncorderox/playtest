class LogsController < ApplicationController
  def index
    @logs = Log.all.order("id DESC")
  end
end
