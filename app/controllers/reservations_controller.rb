class ReservationsController < ApplicationController
  before_action :logged_in_user

  def index
    @reservations = current_user.reservations.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @inn_id ||= params[:reservation_inn_id]
    @reservation = Reservation.new
  end

  def confirm
    @reservation = current_user.reservations.build(reservation_params)
    if @reservation.invalid?
      flash.now[:warning] = "予約確認画面に進めませんでした"
      hold_inn_id
      return
    end
    if how_long_day(@reservation) <= 0
      flash.now[:warning] = "終了日が開始日より後の日付になるように入力してください。"
      hold_inn_id
      return
    end
    inn = @reservation.inn
    @total_price = @reservation.number * how_long_day(@reservation).to_i * inn.price
  end

  def create
    @reservation = current_user.reservations.build(reservation_params)
    if params[:back]
      hold_inn_id
      return
    end
    if @reservation.save
      flash[:success] = "予約が完了しました。"
      redirect_to @reservation
    else
      flash.now[:warning] = "予約できませんでした。"
      hold_inn_id
      return
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:total_price, :start_time, :finish_time, :number, :inn_id)
  end

  def hold_inn_id
    @inn_id = @reservation.inn_id
    render :new
  end

end
