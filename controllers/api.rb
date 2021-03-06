class ApiApp < App
  before do
    content_type :json
    @current_user = User[session[:user_id]] if !session[:user_id].blank?
  end

  post '/signin' do
    sleep(3)
    if params[:email].blank? || params[:password].blank?
      halt(404, { error: 'email and/or password required' })
    end

    # login
    user =
      User.login(
        { email: params[:email].downcase, password: params[:password] }
      )
    if user.blank? || false
      halt(403, { user: user, error: 'invalid auth' }.to_json)
    end

    payload = { user_id: user.id }
    token = JWT.encode(payload, @hmac_secret, 'HS256')
    session[:user_id] = user.id

    return { code: 200, user: user, access_token: token }.to_json
  end

  post '/signup' do
    params[role: 'user']
    user = User.create(params)
    session[:user_id] = user[:id]
    return { user: user }.to_json
  end

  get '/posts' do
    posts = Post.where(user_id: @current_user[:id]).all.reverse
    return { posts: posts }.to_json
  end

  post '/posts' do
    params[:status] = 'draft' if params[:status].blank?
    params[:user_id] = @current_user[:id]
    post = Post.save(params)

    return { post: post }.to_json
  end

  delete '/posts/:id' do
    res = Post[params[:id]].delete
    return { status: 'ok ' }.to_json
  end
end
