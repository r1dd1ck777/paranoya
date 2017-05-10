class Api::Unauthorized < Exception
end

class Api::V1::Log::LogsController < ActionController::API
  before_action :best_secure_ever

  rescue_from Api::Unauthorized, with: :on_401

  def create
    resource = model.new
    resource.assign_attributes params.require(:attributes).permit!

    if resource.save
      render json: resource
    else
      render json: resource.errors, status: :unprocessable_entity
    end
  end

  def on_401
    head 401
  end

  protected

  def model
    ::Log::Log
  end

  def best_secure_ever
    raise Api::Unauthorized unless request.headers['X-Token'] == 'a89sdhj98ahsd0asdas08dLsdgaf_dasgdua245flls'
  end
end
