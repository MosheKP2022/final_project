class RemoveSubCategoryFromTags < ActiveRecord::Migration[6.0]
  def change
    remove_column :tags, :sub_category
  end

end
