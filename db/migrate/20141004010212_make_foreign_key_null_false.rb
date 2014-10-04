class MakeForeignKeyNullFalse < ActiveRecord::Migration
  def change
    change_column :cars, :manufacturer_id, :integer, :null => false
  end
end
