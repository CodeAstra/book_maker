class AddOwnerToBooks < ActiveRecord::Migration
  def change
    add_reference :books, :owner, index: true, foreign_key: true
  end
end
