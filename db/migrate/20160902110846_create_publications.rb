class CreatePublications < ActiveRecord::Migration
  def change
    create_table do |t|
      t.references :work
      t.string :publisher
      t.integer :publication_year
      t.string :format
      t.integer :isbn10
      t.integer :isbn13
    end
  end
end
