class CreateResumeSnippets < ActiveRecord::Migration
  def change
    create_table :resume_snippets do |t|
      t.integer :position
      t.references :resume, index: true, foreign_key: true
      t.references :snippet, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
