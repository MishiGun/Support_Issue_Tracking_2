class Status < ActiveRecord::Base
  
  belongs_to :ticket

  validates :status_type, presence: true
  
end