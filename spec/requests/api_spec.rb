require 'swagger_helper'

RSpec.describe 'Microposts API', type: :request do

  setup do
    @microposts = Micropost.all
  end

  path '/api' do
    get('get all microposts data in json') do
      tags 'Microposts'
      produces 'application/json'
      response 200, 'microposts found' do
        run_test! do |response|
          data = JSON.parse(response.body, object_class: Micropost)
          expect(data).to eq(@microposts)
        end
      end
    end
  end

  path '/api/{id}' do
    get 'Retrieves a micropost' do
      tags 'Microposts'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string
      response 200, 'micropost found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 content: { type: :string },
                 user_id: { type: :integer }
               }

        let(:id) { Micropost.create(content: 'content for testing', user_id: create(:user).id).id }
        run_test!
      end

      response '404', 'micropost not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
