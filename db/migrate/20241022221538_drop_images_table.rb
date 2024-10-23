class DropImagesTable < ActiveRecord::Migration[7.2]
  def up
    drop_table :images
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
