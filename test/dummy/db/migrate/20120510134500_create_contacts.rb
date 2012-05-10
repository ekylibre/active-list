class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :person_id
      t.text :address
      t.string :phone
      t.string :fax
      t.string :country

      t.timestamps
    end
  end
end
