class CreateInterviewFormatsEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :interview_formats_entries do |t|
      t.integer :company_id
      t.integer :format_id
      t.integer :round

      t.timestamps
    end
  end
end
