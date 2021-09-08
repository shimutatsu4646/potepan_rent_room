class InnsController < ApplicationController
  before_action :logged_in_user, only:[:new, :create, :edit, :update, :destroy, :login_user_index]
  before_action :set_q, only: [:index, :search]

  def index
    @inns = Inn.all
  end

  def show
    @inn = Inn.find(params[:id])
  end

  def new
    @inn = Inn.new
  end

  def create
    @inn = current_user.inns.build(inn_params)
    # @inn.image.attach(params[:inn][:image])
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
    # 終了日がreservationインスタンスの現在時刻より後のものがないときに削除できるものとする。
  end

  def search
    @results = @q.result
  end

  def login_user_index
    @current_user_inns = current_user.inns.all
  end

  private

  def inn_params
    params.require(:inn).permit(:name, :introduction, :price, :adress, :image)
  end

  def set_q
    @q = Inn.ransack(params[:q])
  end
end
