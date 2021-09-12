class InnsController < ApplicationController
  before_action :logged_in_user, only:[:new, :create, :edit, :update, :login_user_index]
  before_action :set_q, only: [:index, :search]

  def index
  end

  def show
    @inn = Inn.find(params[:id])
    @user = @inn.user
  end

  def new
    @inn = Inn.new
  end

  def create
    @inn = current_user.inns.build(inn_params)
    # @inn.image.attach(params[:inn][:image])
    if @inn.save
      flash[:success] = "登録しました。"
      redirect_to @inn
    else
      flash.now[:warning] = "登録できませんでした。"
      render "new"
    end
  end


  def edit
    @inn = Inn.find(params[:id])
    inn_create_user?
  end

  def update
    @inn = Inn.find(params[:id])
    inn_create_user?
    if @inn.update(inn_params)
      flash[:success] = "編集しました。"
      redirect_to @inn
    else
      flash.now[:warning] = "編集できませんでした。"
      render "edit"
    end
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
