require 'sinatra'
require './stable_diffusion'

class App < Sinatra::Base
  get '/queue' do
    puts params[:text]
    StableDiffusion.perform_async(params[:text])

    content_type :json
    response = {
      body: "perform async"
    }
    response.to_json
  end
end
