class AddTestLevelDefault < ActiveRecord::Migration[5.2]
  def up
    change_column_default :tests, :level, 1
  end

  def down
    change_column_default :tests, :level, nil
  end
end
