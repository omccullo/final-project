class AddFrequencyToFormatEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :interview_formats_entries, :frequency, :integer
  end
end
