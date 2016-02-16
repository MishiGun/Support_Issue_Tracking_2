class Ticket < ActiveRecord::Base
  
  has_many :statuses
  has_many :users
  has_many :answers
  
  validates :name, presence: true
  validates :email, presence: true

end