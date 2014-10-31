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

	def food_capitalize
		name_array = self.name.split(" ")
		capitals = name_array.map {|word| word.capitalize}
		capitals.join(",").gsub(",", " ")
	end

end