class Party < ActiveRecord::Base
	has_many(:orders)
	has_many(:foods, :through => :orders)

	def to_s
		"Table "+self.table_number.to_s+" has "+self.guests.to_s+" guests."
	end

	def total
		prices = self.foods.map {|food| food.price}
		total_amount = prices.inject(:+)
		total_amount
	end

	def tip(percent)
		prices = self.foods.map {|food| food.price}
		total_amount = prices.inject(:+)
		if self.orders.count > 0
			tip_amount = (total_amount)*(percent.to_f)
			tip_amount.round(2)
		else
			""
		end
	end

end