class Food < ActiveRecord::Base
	validates :name, uniqueness: true
	has_many(:orders)
	has_many(:parties, :through => :orders)

	def is_spicy
		if self.spicy == true
			"spicyness"
		else
			"nospicy"
		end	
	end

end