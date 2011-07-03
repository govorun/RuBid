#encoding: utf-8

class Lot
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title
  field :amount, type: Integer
  field :shortdesc
  field :longdesc
  field :html_longdesc
  field :type
  field :status
  # Деньги храним в копейках
  field :buyoutbid, type: Integer
  field :startingbid, type: Integer

  field :keywords, type: Array

  embedded_in :users, :inverse_of => :lot, :index => true
  embeds_many :bids, :inverse_of => :lot, index: true




end
