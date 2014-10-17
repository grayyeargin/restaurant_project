class Party < ActiveRecord::Base
	validates :table_number, uniqueness: true 
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

	def print_receipt

		file = File.open("public/"+self.id.to_s+"_"+self.last_name+"_party_receipt.txt", "w")
		file << "-----------------------------\n"
		file << "    Thanks for eating at...  \n"
		file << "...Nick Cage's Place of Food!\n"
		file << "*****************************\n"
		file << self.last_name+" Party\n"
		file << "Sitting at Table "+self.table_number.to_s+"\n"
		self.orders.each do |order|
			file << order.to_s+"\n"
		end
		file << "*****************************\n"
		file << "Total: "+self.total.to_s+"\n"
		file << "Tip: 15% = "+self.tip(0.15).to_s+"\n"
		file << "     20% = "+self.tip(0.20).to_s+"\n"
		file << "     25% = "+self.tip(0.25).to_s+"\n"
		file << "-----------------------------\n"
		file.close

		all_receipts =  File.open("public/ALLRECEIPTS.txt", "a")
		all_receipts << ""
		all_receipts << File.read("public/"+self.id.to_s+"_"+self.last_name+"_party_receipt.txt")
		all_receipts << ""
		all_receipts.close

		# open("/parties/"+self.id.to_s+"/receipt") {|f|
  # 	f.each_line {|line| p line}
		# }
	end

end


