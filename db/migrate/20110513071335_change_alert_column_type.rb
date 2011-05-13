class ChangeAlertColumnType < ActiveRecord::Migration
  def self.up
    rename_column :alerts, :type, :alert_type
  end

  def self.down
    rename_column :alerts, :type, :alert_type
  end
end
