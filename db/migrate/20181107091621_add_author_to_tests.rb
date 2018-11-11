class AddAuthorToTests < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :author, foreign_key: true
    change_column_null :tests, :author_id, false
  end
end
