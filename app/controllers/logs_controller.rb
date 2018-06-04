class LogsController < ApplicationController

  def index
    @logs = Log.all.order("id DESC").limit(10)

  end
end
