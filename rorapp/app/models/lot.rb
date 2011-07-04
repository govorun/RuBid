#encoding: utf-8

class Lot
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :amount, type: Integer
  field :amountsold, type: Integer
  field :shortdesc
  field :longdesc
  field :html_longdesc
  field :status  # Draft/Active(/Deleted?)
  # Деньги храним в копейках
  # Если startingbid == buyoutbid, значит это "продажа", а не "аукцион"
  field :buyoutbid, type: Integer
  field :startingbid, type: Integer

  field :expires_at, type: DateTime

  # Для полнотекстового поиска, сюда складываются все слова из title и, возможно, shortdesc
  field :keywords, type: Array

  # Метки (принадлежность к категориям, нужно описать предопределенный набор тегов)
  field :tags, type: Array

  belongs_to :user, :inverse_of => :lot, :index => true
  embeds_many :bids, :inverse_of => :lot, index: true

  before_create :setexpiration

  def currentbid
    self.startingbid
  end

  def setexpiration
    self.expires_at = Time.now + 1.day
  end


end
