RSpec.describe Comment, type: :model do

  before do
    Fabricate(:comment)
  end

  describe "validations" do
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:cast_id) }
    it { should belong_to :user }
    it { should belong_to :cast }
  end
end