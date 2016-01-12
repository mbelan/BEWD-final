class RemoveClaimedByFromItems < ActiveRecord::Migration
  def change
  	remove_column :items, :claimed_by, :string
  end
end
