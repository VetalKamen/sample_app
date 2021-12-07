class ApiController < ApplicationController
  rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found

  def show
    @micropost = Micropost.find(params[:id])
  end

  def index
    @microposts = Micropost.all
  end

  private

  def record_not_found(exception)
    render json: { error: exception.message }.to_json, status: 404
  end
end
