class StaticController < ApplicationController
  def index
    redirect_to '/admin'
  end

  def code
    head params[:code]
  end
end