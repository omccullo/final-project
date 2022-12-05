class AddGeneralColumnToInterviewFormat < ActiveRecord::Migration[6.0]
  def change
    add_column :interview_formats, :general, :string
  end
end
