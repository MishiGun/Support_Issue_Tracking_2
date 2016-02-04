class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :key
      t.string :name
      t.string :email
      t.string :department
      t.string :subject
      t.text :text
      t.string :status

      t.timestamps
    end
  end
end