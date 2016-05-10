class CreateAuthorships < ActiveRecord::Migration
  def change
    create_table :authorships do |t|
      t.references :book, index: true, foreign_key: true
      t.references :invitee, index: true, foreign_key: true
      t.references :inviter, index: true, foreign_key: true
      t.boolean :accepted, default: false

      t.timestamps null: false
    end
    add_index :authorships, :accepted
  end
end
