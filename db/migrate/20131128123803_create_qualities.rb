class CreateQualities < ActiveRecord::Migration
  def change
    create_table :qualities do |t|
      t.string :quality

      t.timestamps
    end
  end
end
