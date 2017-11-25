class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons, id: :uuid do |t|
      t.string :name
      t.boolean :active, default: false
      t.uuid :company_id

      t.timestamps
    end
  end
end
