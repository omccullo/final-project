class CreateCompanyRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :company_roles do |t|
      t.string :name
      t.string :full_part_time
      t.integer :interview_question_entries_count
      t.integer :interview_formats_entries_count

      t.timestamps
    end
  end
end
