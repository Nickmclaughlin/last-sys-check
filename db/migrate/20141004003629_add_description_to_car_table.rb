class AddDescriptionToCarTable < ActiveRecord::Migration
  def change
    add_column :cars, :description, :string
  end
end
