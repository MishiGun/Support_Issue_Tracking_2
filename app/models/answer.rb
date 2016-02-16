class Answer < ActiveRecord::Base

  belongs_to :user
  belongs_to :ticket

  validates :answer_text, presence: true

end
