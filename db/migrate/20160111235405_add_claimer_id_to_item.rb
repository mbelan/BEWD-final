class AddClaimerIdToItem < ActiveRecord::Migration
  def change
  	add_column :items, :claimer_id, :integer
  end
end
