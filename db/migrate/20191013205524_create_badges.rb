class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :image, null: false, default: 'https://cdn.pixabay.com/photo/2013/07/12/16/34/award-151151__340.png'
      t.integer :rule_id

      t.timestamps
    end

    add_index :badges, :name
  end
end
