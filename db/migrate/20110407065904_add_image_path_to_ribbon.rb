class AddImagePathToRibbon < ActiveRecord::Migration
  def self.up
    add_column :ribbons, :image_path, :string
  end

  def self.down
    remove_column :ribbons, :image_path
  end
end
