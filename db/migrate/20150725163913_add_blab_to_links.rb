class AddBlabToLinks < ActiveRecord::Migration
  def change
    add_column :links, :blab, :text
  end
end
