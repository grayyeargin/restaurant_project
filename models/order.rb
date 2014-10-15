class Order < ActiveRecord::Base
	belongs_to(:food)
	belongs_to(:party)

	def to_s
		"---------------------\n---
		Party #"+self.party.id.to_s+"
		sitting at Table "+self.party.table_number.to_s+"
		Order: "+self.food.name.to_s+"
		-------------------------"
	end
end