class CreateHumen < ActiveRecord::Migration
  def change
    create_table :humen do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
