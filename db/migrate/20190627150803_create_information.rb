class CreateInformation < ActiveRecord::Migration[5.2]
  def change
    create_table :information do |t|
      t.string :name
      t.integer :age

      t.timestamps
    end
  end
end
