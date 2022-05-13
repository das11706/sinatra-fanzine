class ZinesController < ApplicationController
  
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
      users = User.all
      erb :'/zines/new'
    else
      redirect '/login'
    end
  end

  get '/zines/:id' do
    if logged_in?
      @zine = Zine.find_by(params[:title])
      erb :'/zines/show_zine'
    else
      redirect '/login'
    end
  end

  get '/zines/:id/edit' do
    if logged_in?
      @zine = Zine.find_by(params[:title])
      erb :'/zines/edit_zine'
    else
      redirect '/login'
    end
  end

  post '/zines' do
    if logged_in?
      if params[:title] == "" || params[:creator] == "" || params[:content] == ""
        redirect '/zines/new'
      else
        @zine = current_user.zines.create(params[:zine])
        redirect '/zines/:id'
      end
    end
  end

  patch '/zines/:id' do
    if logged_in?
      @zine = Zine.find_by(params[:title])
      @zine.update(params[:zine])
      redirect "/zines/#{@zine.id}/edit"
    else
      redirect '/login'
    end
  end

  delete '/zines/:id' do
    @zine = Zine.find_by(params[:title])
    @zine.delete
    redirect to '/zines'
  end

end