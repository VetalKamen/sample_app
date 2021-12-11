module Api
  class ApiController < ApplicationController
    rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found

    private

    def record_not_found(exception)
      render json: { error: exception.message }.to_json, status: 404
    end
  end
end
