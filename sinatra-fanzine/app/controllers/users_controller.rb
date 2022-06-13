class UsersController < ApplicationController

  get '/users' do
    @users = User.all 
    erb :'/users/show'
  end

  get '/signup' do
    if !logged_in?
      erb :'/users/create_user'
    else 
      redirect '/zines'
    end
  end

  post '/signup' do
    puts params
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @user.save
      session[:user_id] = @user.id 
        redirect '/zines'
    end
  end

  get '/login' do 
    if logged_in?
      redirect "/zines"
    else
      erb :'users/login'
    end
  end

  post '/login' do
    puts params
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/zines"
    else
      redirect '/signup'
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect to "/login"
    else
      redirect to "/"
    end
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'/users/show'
  end

  get '/users/new' do
    @zines = Zine.all
    erb :'/users/create_user'
  end
  
end