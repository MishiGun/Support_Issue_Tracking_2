class Ticket < ActiveRecord::Base
  
  has_many :statuses
  has_many :answers
  
  validates :name, presence: true
  validates :email, presence: true
  validates :text, presence: true

  after_create :reindex!
  after_update :reindex!

  scope :filter_status, -> (status) {where status: status}
 
  searchable do
    text :key
    text :name
    text :subject 
    text :staff_name
  end
   
  protected
 
  def reindex!
  	Sunspot.index!(self)
  end

end