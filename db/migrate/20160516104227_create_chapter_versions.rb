class CreateChapterVersions < ActiveRecord::Migration
  def change
    create_table :chapter_versions do |t|
      t.references :book_version, index: true, foreign_key: true
      t.string :title

      t.timestamps null: false
    end
  end
end
