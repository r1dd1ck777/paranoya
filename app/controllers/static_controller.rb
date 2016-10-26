class StaticController < ApplicationController
  def index
    redirect_to '/admin'
  end
end