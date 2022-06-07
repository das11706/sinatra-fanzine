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

  post '/zines' do
    # puts params
    if logged_in?
      if params[:title] == "" || params[:creator] == "" || params[:content] == "" && !@zine
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
        flash[:message] = "Only creator can make changes."
        redirect '/zines'
      end
    else
      redirect '/login'
    end
  end


  patch '/zines/:id' do
    if logged_in?
      @zine = Zine.find_by(params[:title])
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
      end
      flash[:message] = "Only creator can delete."
      redirect to '/zines'
    else
      redirect '/login'
    end
  end

  # get '/zines/logout' do
  #   if logged_in?
  #     session.clear
  #     redirect to "/login"
  #   else
  #     redirect to "/"
  #   end
  # end

end