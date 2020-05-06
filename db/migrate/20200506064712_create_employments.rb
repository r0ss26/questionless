class CreateEmployments < ActiveRecord::Migration[5.2]
  def change
    create_table :employments do |t|
      t.string :position
      t.string :company
      t.integer :start_year
      t.integer :end_year
      t.boolean :currently
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
