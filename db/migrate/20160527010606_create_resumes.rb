class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.string :name
      t.integer :template
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end