class AddTimeColumnToInterviewFormats < ActiveRecord::Migration[6.0]
  def change
    add_column :interview_formats, :time_format, :string
  end
end
