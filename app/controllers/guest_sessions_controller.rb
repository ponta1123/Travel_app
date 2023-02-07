class GuestSessionsController < ApplicationController
  def create
    user = User.find_or_create_by(email: "guest@otamesi.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.nick_name = "ゲストユーザー"
      user.prefectural = "ゲスト大分県"
      user.city = "ゲスト大分市"
    end
    session[:user_id] = user.id
    flash[:notice] = "ゲストユーザーとしてログインしました"
    redirect_to root_path
  end
end
