class UsersController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update]
  before_action :correct_user?, only:[:edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to @user, notice: "アカウントを登録しました。"
    else
      flash[:alert] = "アカウントが登録できませんでした。"
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    current_password = params[:user][:current_password]
    profile_form = params[:user][:profile]
    if !@user.authenticate(current_password) && profile_form.nil?
      flash[:alert] = "入力した「現在のパスワード」が間違っています。もしくは入力していません。"
      render "edit"
      return
    end
    if @user.update(user_params)
      flash[:notice] = "編集しました。"
      redirect_to @user
    else
      flash[:alert] = "編集できませんでした。"
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :password_digest, :icon_image, :introduction)
  end

end
