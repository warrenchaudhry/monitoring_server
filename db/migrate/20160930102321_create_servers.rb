class CreateServers < ActiveRecord::Migration[5.0]
  def change
    create_table :servers do |t|
      t.string :name
      t.string :host
      t.integer :port, default: 80
      t.text :description
      t.boolean :authenticated, default: false
      t.string :auth_token

      t.timestamps
    end
  end
end
