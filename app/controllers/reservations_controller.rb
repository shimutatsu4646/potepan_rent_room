class ReservationsController < ApplicationController
  before_action :logged_in_user, only:[:new, :confirm, :create]
  
  def index
    # ログインユーザーが予約している宿を一覧にする
    @reservations = current_user.reservations.all
  end

  def show
  end

  def new
    @reservation = Reservation.new
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    render :new if @reservation.invalid?
    start_date = @reservation.start_time
    finish_date = @reservation.finish_time
    how_long = finish_date - start_date
    @total_price = @reservation.inn.price * @reservation.number * how_long
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if params[:back]
      render "new"
    elsif @reservation.save
      flash[:notice] = "予約が完了しました。"
      redirect_to @reservation
    else
      render "new"
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:total_price, :start_time, :finish_time, :number)
  end
end
