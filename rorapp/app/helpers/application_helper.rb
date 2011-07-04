#encoding: utf-8

module ApplicationHelper
#  include ActionView::Helpers::DateHelper


  # Return a title on a per-page basis.
  def title
    base_title = "Аукцион цифровых товаров «RuBid»"
    if @title.nil?
      base_title
    else
      "#{h(@title)} | #{base_title}"
    end
  end

  def is_admin?
    return true if current_user.try(:admin?)
  end

  def logo
    image_tag("logo.png", :alt => "RuBid", :class => "round", :title => "Владимир, ёба, где логотип?")
  end

  def display_time(total_seconds)
    total_seconds = total_seconds.to_i

    days = total_seconds / 86400
    hours = (total_seconds / 3600) - (days * 24)
    minutes = (total_seconds / 60) - (hours * 60) - (days * 1440)
    seconds = total_seconds % 60

    display = ''
    display_concat = ''
    if days > 0
      display = display + display_concat + "#{days}д"
      display_concat = ' '
    end
    if hours > 0 || display.length > 0
      display = display + display_concat + "#{hours}ч"
      display_concat = ' '
    end
    if minutes > 0 || display.length > 0
      display = display + display_concat + "#{minutes}м"
      display_concat = ' '
    end
    display = display + display_concat + "#{seconds}с"
    display
  end

  def timeleft(exptime)
    display_time(exptime.to_i - Time.now.to_i) unless exptime.nil?
  end


end
