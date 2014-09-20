class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :zip, :limit => 9
      t.string :addressable_id, :null => false
      t.string :addressable_type, :null => false

      t.timestamps
    end
  end
end
