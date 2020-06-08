class CreateRoutines < ActiveRecord::Migration[6.0]
  def change
    create_table :routines do |t|
      t.string :name
      t.text :description
      t.integer :duration   
      t.integer :user_id
      t.integer :category_id 

      t.timestamps
    end
  end
end
