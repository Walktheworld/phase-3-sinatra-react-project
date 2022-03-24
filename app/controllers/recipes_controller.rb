class RecipesController < ApplicationController
  get '/recipes' do
    Recipe.all.to_json(include:[user: {except:[:created_at, :updated_at]}], except: [:created_at, :updated_at, :user_id])
  end

  post '/recipes' do
    recipe = Recipe.create(params)
    if recipe.id
      recipe.to_json(include: :user)
    else
      recipe.errors.full_messages.to_sentance
    end
  end

  get '/recipes/:id' do
    recipe= Recipe.find_by_id(params["id"])
    if recipe
      recipe.to_json
    else
      {errors: "Record not found, use different id."}.to_json
    end
  end

  patch '/recipes/:id' do
    recipe= User.find_by_id(params["id"])
    if recipe && recipe.update(params)
      recipe.to_json(include: :recipes)
    elsif !recipe
      {errors: "Record not found with id #{params['id']}"}.to_json
    else
      recipe.errors.full_messages.to_sentance
    end
  end
  
  delete '/recipes/:id' do
    recipe = Recipe.find(params["id"])
    if recipe&.destroy
      {messages: "Record deleted"}.to_json
    else
      {errors: "Record not found with id #{params['id']}."}.to_json
    end
  end
end
