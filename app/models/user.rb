class User < ApplicationRecord
  validates :name, {presence: true, length:{maximum: 20}, uniqueness:true}
  validates :email, {presence: true, uniqueness:true}
  validates :password, {presence: true}

  def posts
    return Post.where(user_id: self.id)
  end

end
