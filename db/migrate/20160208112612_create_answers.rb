class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
		t.text :answer_text
      	t.integer :ticket_id
      	t.integer :user_id

      	t.timestamps
    end
  end
end
