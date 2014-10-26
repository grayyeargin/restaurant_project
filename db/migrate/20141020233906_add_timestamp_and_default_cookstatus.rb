class AddTimestampAndDefaultCookstatus < ActiveRecord::Migration
  def change
  	add_column :orders, :order_time, :timestamp, :default => Date.new
  	change_column_default :orders, :cook_status, false
  end
end
