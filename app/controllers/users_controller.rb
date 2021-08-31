class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "アカウントを登録しました。"
      redirect_to @user
    else
      flash[:alert] = "アカウントが登録できませんでした。"
      render "new"      
    end
  end

  def edit
    @user = User.find(params[:id])
    # @params_key_value = params[:key]
  end
  
  def update
    # @user = User.find(params[:id])
    if params[:key] == "account" #もしくは↓
    # if @params_key_value == "account"
      #↓入力された「現在のパスワード」と実際のパスワードが一致いないとき
      if params[:current_password] != @user.password
        flash[:alert] = "入力した「変更前のパスワード」が間違っています。"
        render "edit"
      end      
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
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :icon_image, :introduction)
  end
  
end
