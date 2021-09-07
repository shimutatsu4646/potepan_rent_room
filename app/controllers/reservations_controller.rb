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
    # binding.pry
  end

  def confirm
    @reservation = current_user.reservations.build(reservation_params)
    render :new if @reservation.invalid?
    start_date = @reservation.start_time
    finish_date = @reservation.finish_time
    how_long = finish_date - start_date
    inn = @reservation.inn
    @total_price = @reservation.number * how_long.to_i * inn.price
  end

  def create
    @reservation = current_user.reservations.build(reservation_params)
    if params[:back]
      @inn_id = @reservation.inn_id
      render :new
      return
    end
    if @reservation.save
      flash[:notice] = "予約が完了しました。"
      redirect_to @reservation
    else
      flash[:alert] = "予約できませんでした。"
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:total_price, :start_time, :finish_time, :number, :inn_id)
  end
end
