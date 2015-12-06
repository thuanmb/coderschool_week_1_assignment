class Order < ActiveRecord::Base
  belongs_to :food
  validates :name, :phone_number, :address, :presence => {:message => 'Please fill the %{value}'},
            :allow_nil => true
end
