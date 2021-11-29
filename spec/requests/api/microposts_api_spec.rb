require 'swagger_helper'

RSpec.describe 'api/microposts_api', type: :request do

  setup do
    @microposts = Micropost.all
  end

  path '/api/microposts' do
    post('get all microposts data in json') do
      tags 'Microposts'
      produces 'application/json'
      response(200, 'successful') do
        run_test! do |response|
          data = JSON.parse(response.body, object_class: Micropost)
          expect(data).to eq(@microposts)
        end
      end
    end
  end
end
