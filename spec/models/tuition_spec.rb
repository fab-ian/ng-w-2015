require 'rails_helper'

RSpec.describe Tuition, type: :model do  
  describe 'database columns' do
    it { should have_db_column :period }
    it { should have_db_column :payment }
    it { should have_db_column :paid }
    it { should have_db_column :student_id }
  end

  describe 'associations' do
    it { is_expected.to belong_to :student }
  end
end
