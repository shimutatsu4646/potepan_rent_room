class UsersController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update, :destroy]
  
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
    if params[:current_password] != @user.password
      flash[:alert] = "入力した「変更前のパスワード」が間違っています。"
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

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :password_digest, :icon_image, :introduction)
  end

end
