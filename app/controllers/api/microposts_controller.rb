module Api
  class MicropostsController < Api::ApiController
    def index
      @microposts = Micropost.all
      # render json: @microposts
    end

    def show
      @micropost = Micropost.find(params[:id])
      # render json: @micropost
    end
  end
end
