class DashboardApp < App

  configure do
    set :erb, :layout => 'dashboard/layout'.to_sym
  end

  before do
    redirect "/signin" if session[:user_id].blank?
    @current_user = User[session[:user_id]]
  end

  get '/' do
    erb :'dashboard/index'
  end

  get '/profile' do
    erb :'dashboard/profile'
  end

end

