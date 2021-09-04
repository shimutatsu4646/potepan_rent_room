class InnsController < ApplicationContoller
  before_action :logged_in_user, only:[:new, :create, :edit, :update, :destroy]
  
  def index
    # ログインしているユーザーに関連付いたinnを一覧にする
    @user = User.find(params[:id])
    @inns = @user.inns.all
  end

  def show
    @inn = Inn.find(params[:id])
  end

  def new
    @inn = Inn.new
  end
  
  def create
    @inn = Inn.new(inn_params)
    if @inn.save
      flash[:notice] = "登録しました。"
      redirect_to @inn
    else
      flash[:alert] = "登録できませんでした。"
      render "new"      
    end
  end
  

  def edit
    @inn = Inn.find(params[:id])
  end
  
  def update
    @inn = Inn.find(params[:id])
    if @inn.update(inn_params)
      flash[:notice] = "編集しました。"
      redirect_to @inn
    else
      flash[:alert] = "編集できませんでした。"
      render "edit"     
    end
  end
  
  def destroy
    # 関連付いた予約（reservation）が一つもないとき、もしくは
    # 終了日が現在時刻より後のものがないときに削除できるものとする。
  end
  
  private
  
  def inn_params
    params.require(:inn).permit(:name, :introduction, :price, :adress, :image)
  end
end
