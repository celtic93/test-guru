class Test < ApplicationRecord

  def self.by_category(category)
    category_id = Category.find_by(title: category).id
    order(title: :desc).where(category_id: category_id).pluck(:title)
  end
end
