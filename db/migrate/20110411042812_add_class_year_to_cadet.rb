class AddClassYearToCadet < ActiveRecord::Migration
  def self.up
    add_column :cadets, :class_year, :integer
  end

  def self.down
    remove_column :cadets, :class_year
  end
end
