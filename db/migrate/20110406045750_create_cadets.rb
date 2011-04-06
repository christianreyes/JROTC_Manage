class CreateCadets < ActiveRecord::Migration
  def self.up
    create_table :cadets do |t|
      t.string :first_name
      t.string :last_name
      t.integer :platoon
      t.string :email
      t.string :phone

      t.timestamps
    end
  end

  def self.down
    drop_table :cadets
  end
end
