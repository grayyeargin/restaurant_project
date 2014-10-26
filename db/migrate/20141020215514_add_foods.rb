class AddFoods < ActiveRecord::Migration
  def change
  	create_table :foods do |t|
  		t.string :name
  		t.string :course
  		t.integer :price, scale: 2
  		t.boolean :spicy, default: false
  	end
  end
end
