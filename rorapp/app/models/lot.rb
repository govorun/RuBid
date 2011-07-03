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
  field :tags, type: Array
  field :status
  # Деньги храним в копейках
  field :buyoutbid, type: Integer
  field :startingbid, type: Integer
  field :expires_at, type: DateTime

  field :keywords, type: Array

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
