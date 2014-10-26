class AddTimestampToFoods < ActiveRecord::Migration
  def change
  	add_column :foods, :time_added, :timestamp
  end
end
