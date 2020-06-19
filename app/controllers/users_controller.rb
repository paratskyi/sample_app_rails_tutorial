class UsersController < ApplicationController
  before_action :logged_in_user, except: %i[new create]
  before_action :correct_user,   only: %i[edit update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.where(activated: true).paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @miniposts = @user.miniposts.paginate(page: params[:page])
    redirect_to(home_path) && return unless @user.activated?
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = 'Please check your email to activate your account.'
      redirect_to home_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = 'Profile updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'User deleted'
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(home_path) unless current_user?(@user)
  end

  def admin_user
    redirect_to(home_path) unless current_user.admin?
  end
end
