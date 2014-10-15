class Food < ActiveRecord::Base
	validates :name, uniqueness: true
	has_many(:orders)
	has_many(:parties, :through => :orders)

end