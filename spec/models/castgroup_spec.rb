RSpec.describe Castgroup, type: :model do

  describe "validations" do
    it { should belong_to :cast }
    it { should belong_to :group }
  end
end