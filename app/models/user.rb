# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :name,  :password, :password_confirmation   # ONLY these attr accessible (to prevent mass assignment)
  has_secure_password  # add password and password_confirmation attributes, require the presence of the password, require that they match, 
  # and add an authenticate method to compare an encrypted password to the password_digest to authenticate users.
  # requires password_digest column in the database

  before_save { |user| user.email = email.downcase }  # not all DB's handle case uniqueness

  validates :name, presence: true, length: { maximum: 50 } 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false } # rails infers uniqueness true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end
