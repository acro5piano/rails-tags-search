class CreateApplicantsTags < ActiveRecord::Migration[5.0]
  def change
    create_table :applicants_tags do |t|
      t.integer :applicant_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
