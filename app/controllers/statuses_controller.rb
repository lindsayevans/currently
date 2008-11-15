class StatusesController < ApplicationController

  def homepage
  end

  def index
   @statuses = Status.find :all
  end


end
