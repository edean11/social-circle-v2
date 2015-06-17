
feature "User signs in" do

  before do
    user = Fabricate(:user, name: "Jenny")
    fill_in "Name", with: user.name
    fill_in "Password", with: "password1"
    fill_in "Default Zip", with: "36608"
    click_button "Sign In"
  end

  scenario "Returning customer signs in" do
    user = Fabricate(:user, name: "Jenny")
    fill_in "Name", with: user.name
    fill_in "Password", with: "password1"
    click_button "Sign In"
    page.should_not have_content("Sign In")
    page.should_not have_content("Sign Up")
    page.should have_content("Sign Out")
    click_on "Sign Out"
    page.should have_content("You have been signed out")
    page.should have_content("Sign In")
    page.should_not have_content("Sign Out")
  end

  scenario "Returning user attempts signin with incorrect password" do
    user = Fabricate(:user, name: "Bob")
    fill_in "Name", with: user.name
    fill_in "Password", with: "wrongpassword"
    click_button "Sign In"
    page.should have_content("We could not sign you in. Please check your name/password and try again.")
    page.should_not have_content("Create your account")
    page.should_not have_content("Password confirmation")
    field_labeled("Name").value.should == user.name
    fill_in "Password", with: "password1"
    click_button "Sign In"
  end

  scenario "User signs in with wrong name" do
    Fabricate(:user, name: 'susie', email: "susie@example.com", password: "ThisIsAwesome", password_confirmation: "ThisIsAwesome")
    fill_in "Name", with: "SusieQ"
    fill_in("Password", with: "ThisIsAwesome")
    click_on "Sign In"
    page.should have_content("We could not sign you in. Please check your name/password and try again.")
  end

  scenario "User signs in with blanks" do
    click_on "Sign In"
    page.should have_content("We could not sign you in. Please check your name/password and try again.")
  end
end
