class AddBirthdateToStudent < ActiveRecord::Migration
  def change
    add_column :students, :birthday, :date
  end
end
