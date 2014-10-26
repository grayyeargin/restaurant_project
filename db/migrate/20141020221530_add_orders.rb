class AddOrders < ActiveRecord::Migration
  def change
  	create_table :orders do |t|
  		t.references :food
  		t.references :party
  		t.boolean :cook_status
  		t.timestamp
  	end
  end
end
