class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.date :born_on
      t.decimal :height

      t.timestamps
    end
  end
end
