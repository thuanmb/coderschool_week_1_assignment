class Food < ActiveRecord::Base
	has_many :orders
	has_one :food_stat
end
