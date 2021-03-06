class AddNullConstraints < ActiveRecord::Migration[5.2]
  def change
    change_column_null :tests, :title, false
    change_column_null :answers, :body, false
    change_column_null :categories, :title, false
    change_column_null :questions, :body, false
    change_column_null :users, :username, false
    change_column_null :users, :email, false
    change_column_null :tests, :category_id, false
    change_column_null :questions, :test_id, false
    change_column_null :answers, :question_id, false
  end
end
