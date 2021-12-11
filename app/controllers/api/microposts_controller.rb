module Api
  class MicropostsController < Api::ApiController
    def index
      @microposts = Micropost.all
    end

    def show
      @micropost = Micropost.find(params[:id])
    end
  end
end
