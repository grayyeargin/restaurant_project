class AddParties < ActiveRecord::Migration
  def change
  	create_table :parties do |t|
  		t.string :last_name
  		t.integer :table_number
  		t.integer :guests
  		t.boolean :payment_status
  		t.timestamp :checkout_time
  	end
  end
end