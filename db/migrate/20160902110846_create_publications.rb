class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.references :work
      t.string :publisher
      t.integer :publication_year
      t.string :format
      t.string :isbn10
      t.string :isbn13
    end
  end
end
