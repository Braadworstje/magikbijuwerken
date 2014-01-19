class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.text :faq
      t.text :terms
      t.text :company
      t.text :contact

      t.timestamps
    end
  end
end
