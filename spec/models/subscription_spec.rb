RSpec.describe Subscription, type: :model do

  describe "validations" do
    it { should belong_to :group }
    it { should belong_to :user }
  end
end