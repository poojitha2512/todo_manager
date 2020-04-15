class User < ActiveRecord::Base
  validates :email, presence: true
  validates :password, presence: true
  validates :first_name, presence: true
  has_secure_password
  has_many :todos
end
