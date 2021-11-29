module Api
  class MicropostsApiController < ActionController::API
    include ActionController::MimeResponds

    def index
      @microposts = Micropost.all
      respond_to do |format|
        format.json { render json: @microposts }
        format.html { render @microposts }
      end
    end
  end
end