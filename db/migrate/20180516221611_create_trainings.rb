class CreateTrainings < ActiveRecord::Migration[5.1]
  def change
    create_table :trainings do |t|
      t.string :name
      t.string :activity
      t.datetime :date
      t.datetime :time
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
