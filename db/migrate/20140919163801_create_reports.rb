class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.boolean :status, :default => false
      t.text :content
      t.references :client, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
