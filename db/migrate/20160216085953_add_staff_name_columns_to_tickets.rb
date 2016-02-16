class AddStaffNameColumnsToTickets < ActiveRecord::Migration
  def change
  	add_column :tickets, :staff_name, :string
  end
end
