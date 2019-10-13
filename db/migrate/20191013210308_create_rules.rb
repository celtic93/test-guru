class CreateRules < ActiveRecord::Migration[5.2]
  def change
    create_table :rules do |t|
      t.string :name, null: false
      t.string :rule_type, null: false
      
      t.timestamps
    end
  end
end
