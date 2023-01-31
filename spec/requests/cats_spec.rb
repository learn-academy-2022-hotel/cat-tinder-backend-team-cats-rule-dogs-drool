require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it "returns all the cats" do
      Cat.create(
        name: 'Ryan',
        age: 3,
        enjoys: 'sleeping',
        image: 'https://live.staticflickr.com/3587/3471300822_c0b9996897_b.jpg'

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
        enjoys: 'climbing',
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
    expect(cat.enjoys).to eq('climbing')

    end
  end
end
