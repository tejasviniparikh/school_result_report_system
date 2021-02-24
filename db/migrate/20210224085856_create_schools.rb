class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.integer :emis
      t.integer :center_no

      t.timestamps
    end
  end
end
