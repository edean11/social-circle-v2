
feature "User creates cast" do

  before do
    visit "/"
    click_on "Sign In"
  end

  scenario "Create invalid cast" do
    user = Fabricate(:user, name: "Jenny")
    fill_in "Name", with: user.name
    fill_in "Password", with: "password1"
    click_button "Sign In"
    page.should have_content("New Cast")
    click_on "New Cast"
    current_path.should == new_cast_path
    page.should have_content("Title")
    page.should have_content("Expiration")
    # don't fill in a required title
    fill_in "Content", with: 'example content'
    fill_in "Expiration", with: '2015/09/17 12:54'
    find('#placeCastMap').click
    click_on "Save Cast"
    current_path.should == new_cast_path
    page.should have_content("Your cast could not be created. Please correct the errors below.")
    page.should have_error("can't be blank", on: "Title")
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
    find('#placeCastMap').click
    click_on "Save Cast"
    current_path.should == user_path(user)
    expect(page).to have_selector('gm-style-iw')
    visit user_path(user)+'/casts.json'
    expect(page.source).to include('example title')
  end

end
