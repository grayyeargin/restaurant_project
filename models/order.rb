class Order < ActiveRecord::Base
	belongs_to(:food)
	belongs_to(:party)

	def free
		self.food.price = 0
	end
end