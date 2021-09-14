module ApplicationHelper

  def inn_image(inn)
    image_tag inn.image.url
  end

  def how_long_day(reservation)
    start_date = reservation.start_time
    finish_date = reservation.finish_time
    days = finish_date - start_date
    return days.to_i
  end

end
