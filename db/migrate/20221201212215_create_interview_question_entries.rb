class CreateInterviewQuestionEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :interview_question_entries do |t|
      t.integer :question_id
      t.integer :company_roles_id
      t.integer :role_id
      t.integer :frequency

      t.timestamps
    end
  end
end
