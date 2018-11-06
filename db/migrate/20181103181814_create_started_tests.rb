class CreateStartedTests < ActiveRecord::Migration[5.2]
  def change
    create_table :started_tests do |t|
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true
      t.boolean :test_started
      t.boolean :test_passed

      t.timestamps
    end
  end
end
