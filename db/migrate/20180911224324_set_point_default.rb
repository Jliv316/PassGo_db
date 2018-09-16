class SetPointDefault < ActiveRecord::Migration[5.2]
  def self.up
    change_column :user_companies, :points, :integer, :default => 0
  end

  def self.down
    # You can't currently remove default values in Rails
    raise ActiveRecord::IrreversibleMigration, "Can't remove the default"
  end
end
