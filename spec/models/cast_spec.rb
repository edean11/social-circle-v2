require 'rails_helper'

RSpec.describe Cast, type: :model do

  describe "validations" do
    it { should belong_to :user }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
  end
end
