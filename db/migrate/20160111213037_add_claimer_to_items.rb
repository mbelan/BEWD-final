class AddClaimerToItems < ActiveRecord::Migration
  def change
    add_column :items, :claimer, :integer
  end
end
