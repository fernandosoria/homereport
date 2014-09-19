class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name, :null => false
      t.string :phone, :limit => 10, :null => false
      t.references :user, index: true

      t.timestamps
    end
  end
end
