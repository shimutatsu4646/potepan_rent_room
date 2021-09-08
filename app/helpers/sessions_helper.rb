module SessionsHelper
  
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
  
  def current_user?
    @user == current_user
  end
  
  def inn_create_user?
    @user = @inn.user
    unless current_user?
      flash[:alert] = "他ユーザーが登録したルームは編集できません"
      redirect_to root_path
    end
  end
  
  def correct_user?
    if User.find(params[:id]) != current_user
      flash[:alert] = "他ユーザーの設定を変更することはできません"
      redirect_to root_path
    end    
  end
  
  def logged_in?
    !current_user.nil?
  end
  
  def log_out
    session.delete(:user_id)
    current_user = nil
  end
  
end
