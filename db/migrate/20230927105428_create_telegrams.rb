class CreateTelegrams < ActiveRecord::Migration[7.0]
  def change
    create_table :telegrams do |t|
      t.string :name
      t.text :description
      t.string :url
      t.string :avatar
      t.string :cover

      t.timestamps
    end
  end
end
