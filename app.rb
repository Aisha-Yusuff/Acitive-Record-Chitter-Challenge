require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './lib/user'
require './lib/peep'

class Chitter < Sinatra::Base
  configure :development do 
    register Sinatra::Reloader
  end 
  
  get '/' do 
    'Hello world'
  end 
  
  get '/users' do # LIST data
    User.all.to_json(include: :peeps) #include peep_id
  end 

  get '/users/:id' do  # READ data
    User.where(id: params['id']).first.to_json(include: :peeps)
  end 

  post '/users' do # CREATE data
    user = User.new(params)
    if user.save
      user.to_json(include: :peeps)
    else
      halt 422, user.errors.full_messages.to_json
    end
  end 

  put '/users/:id' do # UPDATE data
    # the id added to URL needs to match the id of data that will be update
    user = User.where(id: params['id']).first 
    if user 
      user.name = params['name'] if params.has_key?('name')
      user.username = params['username'] if params.has_key?('username')

      if user.save
        user.to_json
      else
        halt 422, user.errors.full_messages.to_json
      end
    end
  end

  delete '/users/:id' do # DELETE entire row of data
    user = User.where(id: params['id'])
    if user.destroy_all
      {success: "ok"}.to_json # return ok if succesfully deleted
    else 
      halt 500
    end 
  end 

  # peeps table 
  get '/peeps' do # LIST data
      Peep.all.to_json
  end 

  get '/peeps/:id' do  # READ data
    Peep.where(id: params['id']).first.to_json
  end 

  post '/peeps' do # CREATE data
    peep = Peep.new(params)
    if peep.save
      peep.to_json
    else
      halt 422, peep.errors.full_messages.to_json
    end
  end 

  put '/peeps/:id' do # UPDATE data
    # the id added to URL needs to match the id of data that will be update
    peep = Peep.where(id: params['id']).first 
    if peep 
      peep.contents = params['content'] if params.has_key?('contents')
      

      if peep.save
        peep.to_json
      else
        halt 422, peep.errors.full_messages.to_json
      end
    end
  end

  delete '/peeps/:id' do # DELETE entire row of data
    peep = Peep.where(id: params['id'])
    if peep.destroy_all
      {success: "ok"}.to_json # return ok if succesfully deleted
    else 
      halt 500
    end 
  end 

  
  run! if app_file == $0
end 