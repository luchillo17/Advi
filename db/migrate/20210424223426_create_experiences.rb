class CreateExperiences < ActiveRecord::Migration[6.1]
  def change
    create_table :experiences do |t|
      t.string :title,      null: false
      t.string :description

      t.timestamps
    end

    add_index :experiences, :title, unique: true
  end
end
