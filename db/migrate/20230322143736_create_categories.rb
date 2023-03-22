class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.binary :name

      t.timestamps
    end
  end
end
