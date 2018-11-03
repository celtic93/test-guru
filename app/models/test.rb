class Test < ApplicationRecord

  def self.by_category(category)
    category_id = Category.find_by(title: category).id
    where(category_id: category_id).order(id: :desc)
  end
end
