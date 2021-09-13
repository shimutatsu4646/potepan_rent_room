module ApplicationHelper

  def inn_image(inn)
    image_tag inn.image.url
  end

end
