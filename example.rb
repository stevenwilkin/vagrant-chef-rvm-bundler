require 'sinatra/base'

class Example < Sinatra::Base
  get '/' do
    'Hello World!'
  end
end
