class CreateSchoolReports < ActiveRecord::Migration[6.0]
  def change
    create_table :school_reports do |t|
      t.integer :year
      t.integer :wrote
      t.integer :passed
      t.belongs_to :school

      t.timestamps
    end
  end
end
