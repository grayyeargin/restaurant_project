class AddDefaultToPartyPaymentStatus < ActiveRecord::Migration
  def change
  	change_column_default :parties, :payment_status, false
  end
end
