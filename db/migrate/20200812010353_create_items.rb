class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.string :type, null:false
      t.string :title
      t.text :content
      t.integer :drink_id
      t.integer :food_id
      t.text :comment

      t.timestamps
    end
  end
end
