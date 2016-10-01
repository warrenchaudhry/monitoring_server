class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.decimal :cpu_usage_limit, default: 50
      t.decimal :disk_usage_limit, default: 50
      t.integer :last_updated_by

      t.timestamps
    end
  end
end
