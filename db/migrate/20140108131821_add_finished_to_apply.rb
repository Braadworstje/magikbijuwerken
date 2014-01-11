class AddFinishedToApply < ActiveRecord::Migration
  def change
  	add_column :user_vacancies, :finished, :boolean, :default => false
  end
end
