require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it "returns all the cats" do
      Cat.create(
        name: 'Steven',
        age: 5,
        enjoys: 'climbing around',
        image: 'https://upload.wikimedia.org/wikipedia/commons/1/1f/Cat_climbing_tree%2C_Uchimaki_Park.jpg'

      )

      get '/cats' 
      
      cat = JSON.parse(response.body)
      p "cat:", cat
      expect(response).to have_http_status(200)
      expect(cat.length).to eq(1)
    end
  end

  describe "POST/create" do
    it "creates a cat" do
      cat_params = {
       cat: {
        name: 'Steven',
        age: 5,
        enjoys: 'climbing around',
        image: 'https://upload.wikimedia.org/wikipedia/commons/1/1f/Cat_climbing_tree%2C_Uchimaki_Park.jpg'
      }
    }
    #request for create endpoint
    post '/cats', params: cat_params

    #status code
    expect(response).to have_http_status(200)
    
    #payload
    cat = Cat.first
    p "cat:", cat
    expect(cat.name).to eq('Steven')
    expect(cat.enjoys).to eq('climbing around')

    end
  end

    it "will not create a cat missing its name" do
      cat_params = {
       cat: {
        age: 5,
        enjoys: 'climbing around',
        image: 'https://upload.wikimedia.org/wikipedia/commons/1/1f/Cat_climbing_tree%2C_Uchimaki_Park.jpg'
      }
    }
    #request for create endpoint
    post '/cats', params: cat_params

    #status code
    expect(response).to have_http_status(422)
    
    #payload
    cat = JSON.parse(response.body)
    p "cat:", cat
    expect(cat['name']).to include("can't be blank")
    end
end
