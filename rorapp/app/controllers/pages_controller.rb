#encoding: utf-8

class PagesController < ApplicationController
  def home
    @title = "Добро пожаловать!"
  end

  def help
    @title = "Помощь"
  end

  def contact
    @title = "Контакты"
  end

  def about
    @title = "О нас"
  end

end
