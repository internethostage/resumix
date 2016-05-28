class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :name
      t.string :type
      t.hstore :properties
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
