class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :applications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :job_offer, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
