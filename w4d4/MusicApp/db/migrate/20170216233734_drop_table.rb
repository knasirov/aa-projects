class DropTable < ActiveRecord::Migration
  def change
    drop_table :albums
    drop_table :tracks
  end
end
