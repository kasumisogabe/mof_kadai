class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.integer :rent
      t.string :adress
      t.integer :age
      t.text :note

      t.timestamps
    end
  end
end
