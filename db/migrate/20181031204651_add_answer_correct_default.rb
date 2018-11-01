class AddAnswerCorrectDefault < ActiveRecord::Migration[5.2]
  def up
    change_column_default :answers, :correct, false
  end

  def down
    change_column_default :answers, :correct, nil
  end
end
