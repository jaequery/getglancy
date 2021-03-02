class SiteApp < App

  configure do
    set :layout => :layout # render views/layout.erb file
  end

  get "/" do
    erb :index
  end

  get "/about" do
    erb :about
  end

  get "/features" do
    erb :features
  end

  get "/help" do
    erb :help
  end

  get "/picks" do
    erb :picks
  end

  get "/pricing" do
    erb :pricing
  end

  post "/contact" do
    content_type :json
    user = User.create(params)
    binding.pry
    sleep(5)
    return user.to_json
  end

  get "/contact" do
    erb :contact
  end

  get "/abort" do
    users = User.where(:first_name => 'Jae').all
    abort
  end

  get "/signin" do
    erb :signin, :layout => :layout_plain
  end

  get "/signup" do
    erb :signup, :layout => :layout_plain
  end

  get "/signout" do
    session.clear
    redirect "/"
  end

  get '/preview' do
    erb :preview, :layout => :layout_plain
  end



end

