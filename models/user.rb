class User < Sequel::Model

  plugin :secure_password, include_validations: false
  plugin :timestamps

  def self.login(params)
    user = User.where("lower(email) = lower(?)", params[:email]).first

    return false if user.blank?
    return false if user.authenticate(params[:password]).blank?

    return user
  end


end