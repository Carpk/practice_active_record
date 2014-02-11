require 'bcrypt'

class User < ActiveRecord::Base
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true

  include BCrypt
  has_secure_password

  has_many :created_events, class_name: "Event"

  has_many :event_attendances, foreign_key: :user_id
  has_many :attended_events, through: :event_attendances, source: :events

  def validate_email
    self.match.(/[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,3}/)
  end


end

