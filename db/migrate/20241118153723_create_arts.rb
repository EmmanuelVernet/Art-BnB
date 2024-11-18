class CreateArts < ActiveRecord::Migration[7.1]
  def change
    create_table :arts do |t|
      t.string :title
      t.string :category
      t.string :name
      t.date :creation_date
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
