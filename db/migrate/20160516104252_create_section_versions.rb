class CreateSectionVersions < ActiveRecord::Migration
  def change
    create_table :section_versions do |t|
      t.references :chapter_version, index: true, foreign_key: true
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
