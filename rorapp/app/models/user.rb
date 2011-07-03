require 'digest'

class User
  include Mongoid::Document

  field :admin, :type => Boolean
  field :name
  field :fullname

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false
  validates_length_of   :password, :maximum => 40
  attr_accessible :name, :fullname, :email, :password, :password_confirmation, :remember_me
  index :name, :unique => true
  index :email, :unique => true

  embeds_many :lots, :inverse_of => :user, index: true

end
