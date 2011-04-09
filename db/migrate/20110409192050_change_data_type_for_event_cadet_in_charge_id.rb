class ChangeDataTypeForEventCadetInChargeId < ActiveRecord::Migration
  def self.up
	change_table :events do |t|
		t.change(:cadet_in_charge_id, :string)
	end
  end

  def self.down
  end
end
