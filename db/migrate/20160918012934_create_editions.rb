class CreateEditions < ActiveRecord::Migration[5.0]
  def change
    create_table :editions do |t|
      t.references :work, foreign_key: true
      # publisher should probably be an optional field
      t.references :publisher, foreign_key: true
      t.integer :publication_year
      # add polymorphic for format types later
      # t.references :format, foreign_key: true

      t.string :format_type
      t.string :isbn10
      t.string :isbn13

      t.timestamps
    end
  end
end
