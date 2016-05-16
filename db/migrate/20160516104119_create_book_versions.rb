class CreateBookVersions < ActiveRecord::Migration
  def change
    create_table :book_versions do |t|
      t.references :book, index: true, foreign_key: true
      t.string :title

      t.timestamps null: false
    end
  end
end
