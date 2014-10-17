class PartyHasntPaidValidator < ActiveModel::Validator
	def validate(record)
		if record.party.payment_status != false
			record.errors[:base] << "Party already left the building"
		end
	end
end


class Order < ActiveRecord::Base
	validates_with PartyHasntPaidValidator
	belongs_to(:food)
	belongs_to(:party)

	def to_s
		if self.food != nil
			"order "+self.id.to_s+": "+self.food.name+" - $"+self.food.price.to_s
		else
			"This item is now sold out!"
		end
	end

	def free
		self.food.price = 0
	end

end