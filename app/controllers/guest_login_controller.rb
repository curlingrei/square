class GuestLoginController < SessionsController
  def create
    email = 'guest@user.com'
    password = 'guestuser'
    if login(email, password)
    flash[:success] = 'ゲストユーザとしてログインしました'
    redirect_to @user
    end
  end

  private 

  def login(email, password)
    super
  end
end
