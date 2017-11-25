class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'pgcrypto'
    create_table :companies, id: :uuid do |t|
      t.string :name
      t.date :trial_status
      t.integer :plan_level

      t.timestamps
    end
  end
end
