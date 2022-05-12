class UsersController < ApplicationController

  get '/users' do
    @users = User.all 
    erb :'/users/show'
  end

  get '/signup' do
    if !logged_in?
      erb :'/users/create_user'
    else 
      redirect '/tweets'
    end
  end

end