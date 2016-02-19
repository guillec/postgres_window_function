class AddAliveToLifeCycles < ActiveRecord::Migration
  def change
    add_column :life_cycles, :alive, :boolean
  end
end
