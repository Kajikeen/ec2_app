class AddPostIdToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :post_id, :integer
  end
end
