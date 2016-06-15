class AddVersionOfIdToSnippet < ActiveRecord::Migration
  def change

    add_reference :snippets, :version_of, references: :snippets, index: true, foreign_key: false
    add_foreign_key :snippets, :snippets, column: :version_of_id
  end
end
