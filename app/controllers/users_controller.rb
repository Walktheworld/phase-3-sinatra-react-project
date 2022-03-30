class UsersController < ApplicationController


  get '/users' do
    User.all.to_json(include:[recipes: {except:[:created_at, :updated_at, :user_id]}], except: [:created_at, :updated_at])
  end

  post '/users' do
    user = User.create(params)
    if user.id
      user.to_json(include: :recipes)
    else
      user.errors.full_messages.to_sentence
    end
  end

  get '/users/:id' do
    user= User.find_by_id(params["id"])
    if user
      user.to_json(include: :recipes)
    else
      {errors: "User not found, use different id."}.to_json
    end
  end

  patch '/users/:id' do
    user= User.find_by_id(params["id"])
    if user && user.update(params)
      user.to_json(include: :recipes)
    elsif !user
      {errors: "Record not found with user_id #{params['id']}"}.to_json
    else
      user.errors.full_messages.to_sentence
    end
  end
  
  delete '/users/:id' do
    user = User.find(params["id"])
    if user&.destroy
      {messages: "Record deleted"}.to_json
    else
      {errors: "Record not found with user_id #{params['id']}."}.to_json
    end
  end
end
