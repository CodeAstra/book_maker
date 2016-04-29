class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :title
      t.text :notes
      t.references :book, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
