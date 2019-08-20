class ChangeDataAnswerToQuestions < ActiveRecord::Migration[5.2]
  def change
    change_column :questions, :answer, :string
    change_column :questions, :good, :string
  end
end
