class AddIndexToSnippetsProperties < ActiveRecord::Migration
  def change
    add_index :snippets, :properties, using: :gin
  end
end
