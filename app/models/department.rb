class Department < ActiveRecord::Base

  belongs_to :ticket

  validates :department_type, presence: true

end
