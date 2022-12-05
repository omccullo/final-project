class AddRoleToInterviewFormatEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :interview_formats_entries, :role_id, :integer
  end
end
