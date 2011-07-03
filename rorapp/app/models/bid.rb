class Bid
  include Mongoid::Document
  field :bidder_id   #user.id of bidder
  field :bidder_name #user.name of bidder, speed sake
  field :bid_value, type: Integer
  field :created_at, type: DateTime

  embedded_in :lots, :inverse_of => :bid, :index => true

end
