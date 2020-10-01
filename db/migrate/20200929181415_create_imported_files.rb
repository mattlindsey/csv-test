class CreateImportedFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :imported_files do |t|
      t.string :title
      t.string :avatar
      t.integer :post_id

      t.timestamps
    end
  end
end
