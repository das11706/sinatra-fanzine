require 'rack-flash'

class ZinesController < ApplicationController
  enable :sessions
  use Rack::Flash
  
  get '/zines' do
    @zines = Zine.all
    if logged_in?
      erb :'/zines/zines'
    else
      redirect to '/login'
    end
  end

  get '/zines/new' do
    if logged_in?
      @users = User.all
      erb :'/zines/new' 
    else
      redirect '/login'
    end
  end

  get '/zines/:id' do
    if logged_in?
      @zine = Zine.find_by_id(params[:id])
      erb :'/zines/show_zine'
    else
      redirect '/login'
    end
  end

  get '/myzines' do 
    if logged_in?
      @zines = current_user.zines
      erb :'/zines/myzines'
    else
      redirect to '/login'
    end    
  end

  post '/zines' do
    # puts params
    if logged_in?
      if params[:title] == "" || params[:creator] == "" || params[:content] == "" 
        redirect '/zines/new'
      else
        @zine = current_user.zines.create(params[:zine])
        # @zine = Zine.find_by_id(params[:id])
        redirect "/zines"
      end
    end
  end

  get '/zines/:id/edit' do
    if logged_in?
      @zine = Zine.find_by_id(params[:id])
      if @zine.user_id == current_user.id
      erb :'/zines/edit_zine'
      else 
        flash[:message] = "Only creator can make changes"
        redirect '/zines'
      end
    else
      redirect '/login'
    end
  end


  patch '/zines/:id' do
    if logged_in?
      @zine = Zine.find_by_id(params[:id])
      @zine.update(params[:zine])
      redirect "/zines/#{@zine.id}"
    else
      redirect '/login'
    end
  end

  delete '/zines/:id' do
    if logged_in?
      @zine = Zine.find_by_id(params[:id])
      if @zine.user_id == current_user.id
      @zine.delete
      redirect '/zines'
      else
      flash[:message] = "Only creator can delete"
      redirect to '/zines' 
      end
    else
      redirect '/login'
    end
  end

end



