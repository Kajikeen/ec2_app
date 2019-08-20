class AddAnswerToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :answer, :integer
    add_column :questions, :good, :boolean, default: false, null: false
  end
end
