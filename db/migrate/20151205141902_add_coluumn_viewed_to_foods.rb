class AddColuumnViewedToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :num_of_viewed, :integer
  end
end
