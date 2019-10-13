class AddStatusToTestPassages < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :status, :string, null: false, default: :passing
  end
end
