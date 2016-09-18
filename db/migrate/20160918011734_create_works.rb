class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.string :title
      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end
