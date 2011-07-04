class Feedback
  include Mongoid::Document
  include Mongoid::Timestamps
  field :author_id
  field :author_name
  field :text
  field :rating, type: Integer

  embedded_in :user, :inverse_of => :feedbacks, :index => true

  after_create :add_rating
  after_destroy :sub_rating

  def add_rating
    user = self.user
    user.inc(:rating,self.rating)
  end

  def sub_rating
    user = self.user
    user.inc(:rating,-self.rating)
  end


end
