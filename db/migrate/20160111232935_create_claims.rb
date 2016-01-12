class CreateClaims < ActiveRecord::Migration
  def change
    create_table :claims do |t|
      t.integer :claimer_id
      t.integer :item_id

      t.timestamps null: false
    end
  end
end
