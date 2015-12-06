class AddColumncToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :type_of_cuisine, :integer
  end
end
