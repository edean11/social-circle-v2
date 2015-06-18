
feature "User creates subscription" do

  before do
    visit "/"
    click_on "Sign In"
  end

  scenario "Create one group subscription" do
    user = Fabricate(:user, name: "Jenny")
    group = Fabricate(:group)
    fill_in "Name", with: user.name
    fill_in "Password", with: "password1"
    click_button "Sign In"
    page.should have_content("New Subscription")
    click_on "New Subscription"
    current_path.should == new_subscription_path
    page.should have_content("Group")
    find('.check_boxes').first.click
    click_on "Subscribe"
    current_path.should == user_path(user)
    page.should have_content("Subscription(s) Created Successfully!")
    visit user_path(user)+'/groups.json'
    expect(page.source).to include('Fake description for group')
  end

  scenario "Create multiple group subscriptions" do
    user = Fabricate(:user, name: "Jenny")
    group = Fabricate(:group)
    group2 = Fabricate(:group, description: 'another fake')
    fill_in "Name", with: user.name
    fill_in "Password", with: "password1"
    click_button "Sign In"
    page.should have_content("New Subscription")
    click_on "New Subscription"
    current_path.should == new_subscription_path
    page.should have_content("Group")
    find('.check_boxes').first.click
    find('.check_boxes').last.click
    click_on "Subscribe"
    current_path.should == user_path(user)
    page.should have_content("Subscription(s) Created Successfully!")
    visit user_path(user)+'/groups.json'
    expect(page.source).to include('Fake description for group')
    expect(page.source).to include('another fake')
  end

end