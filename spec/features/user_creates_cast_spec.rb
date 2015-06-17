
feature "User signs in" do

  before do
    visit "/"
    click_on "Sign In"
  end

  scenario "Create valid cast" do
    user = Fabricate(:user, name: "Jenny")
    fill_in "Name", with: user.name
    fill_in "Password", with: "password1"
    click_button "Sign In"
    page.should have_content("New Cast")
    click_on "New Cast"
    current_path.should == new_cast_path
    page.should have_content("Title")
    page.should have_content("Expiration")
    fill_in "Title", with: 'example title'
    fill_in "Content", with: 'example content'
    fill_in "Expiration", with: '2015/09/17 12:54'
    page.driver.click(450,450)
    click_on "Set Chosen Location"
    current_path.should == user_path(user)
    page.should have_selector('castPopup', :count => 1)
  end

end
