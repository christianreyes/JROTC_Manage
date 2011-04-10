class AddMiddleNameToCadet < ActiveRecord::Migration
  def self.up
    add_column :cadets, :middle_name, :string
  end

  def self.down
    remove_column :cadets, :middle_name
  end
end
