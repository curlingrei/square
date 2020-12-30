class GuestLoginController < SessionsController
  def create
    email = 'guest@user.com'
    password = 'guestuser'
    if login(email, password)
      flash[:light] = 'ゲストユーザとしてログインしました'
      redirect_to @user
    end
  end
end
