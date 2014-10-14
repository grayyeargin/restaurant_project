class Party < ActiveRecord::Base
	has_many(:orders)
	has_many(:foods, :through => :orders)

	def to_s
		"Table "+self.table_number.to_s+" has "+self.guests.to_s+" guests."
	end

end