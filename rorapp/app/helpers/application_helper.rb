#encoding: utf-8

module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = "Аукцион цифровых товаров «RuBid»"
    if @title.nil?
      base_title
    else
      "#{h(@title)} | #{base_title}"
    end
  end

  def logo
    image_tag("logo.png", :alt => "RuBid", :class => "round", :title => "Владимир, ёба, где логотип?")
  end


end
