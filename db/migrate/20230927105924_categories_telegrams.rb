class CategoriesTelegrams < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_telegrams, id: false do |t|
      t.belongs_to :category
      t.belongs_to :telegram
    end
  end
end
