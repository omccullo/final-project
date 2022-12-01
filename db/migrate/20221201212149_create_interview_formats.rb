class CreateInterviewFormats < ActiveRecord::Migration[6.0]
  def change
    create_table :interview_formats do |t|
      t.integer :number_of_interviews
      t.string :duration
      t.string :behavioral
      t.string :case

      t.timestamps
    end
  end
end
