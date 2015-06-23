
feature "User creates group" do

  before do
    visit "/"
    click_on "Sign In"
  end

  scenario "Create invalid group" do
    user = Fabricate(:user, name: "Jenny")
    fill_in "Name", with: user.name
    fill_in "Password", with: "password1"
    click_button "Submit"
    page.should have_content("New Group")
    click_on "New Group"
    current_path.should == new_group_path
    page.should have_content("Name")
    page.should have_content("Description")
    # don't fill in a required name
    fill_in "Description", with: 'example content'
    click_on "Create Group"
    current_path.should == new_group_path
    page.should have_content("Your group could not be created. Please correct the errors below.")
    page.should have_error("can't be blank", on: "Name")
  end

  scenario "Create valid group" do
    user = Fabricate(:user, name: "Jenny")
    fill_in "Name", with: user.name
    fill_in "Password", with: "password1"
    click_button "Submit"
    page.should have_content("New Group")
    click_on "New Group"
    current_path.should == new_group_path
    page.should have_content("Name")
    page.should have_content("Description")
    fill_in "Name", with: 'example'
    fill_in "Description", with: 'example content'
    click_on "Create Group"
    current_path.should == user_path(user)
    page.should have_content("example")
    visit user_path(user)+'/groups.json'
    expect(page.source).to include('example content')
  end

end
