class CreateLifeCycles < ActiveRecord::Migration
  def change
    create_table :life_cycles do |t|
      t.integer :human_id
      t.integer :kind
      t.string  :description

      t.timestamps null: false
    end
  end
end
