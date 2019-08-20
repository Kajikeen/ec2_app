class ChangeDataGoodToQuestions < ActiveRecord::Migration[5.2]
  def change
    change_column :questions, :good, :integer
  end
end
