RSpec.describe Group, type: :model do

  before do
    Fabricate(:group)
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(30)}
    it { should validate_uniqueness_of(:name) }
  end
end