class CreateUserExperiences < ActiveRecord::Migration[6.1]
  def change
    create_table :user_experiences do |t|
      t.references :user, null: false, foreign_key: true
      t.references :experience, null: false, foreign_key: true
      t.interval :expertise_time, null: false

      t.timestamps
    end
  end
end
