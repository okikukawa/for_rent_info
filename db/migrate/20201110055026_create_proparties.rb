class CreateProparties < ActiveRecord::Migration[5.2]
  def change
    create_table :proparties do |t|
      t.string :name
      t.integer :price
      t.string :address
      t.integer :age
      t.text :content
      t.timestamps
    end
  end
end
