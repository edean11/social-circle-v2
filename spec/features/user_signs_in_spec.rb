
feature "User signs in" do

  before do
    visit "/"
  end

  scenario "Returning customer signs in" do
    user = Fabricate(:user, name: "Jenny")
    fill_in "Name", with: user.name
    fill_in "Password", with: "password1234"
    click_button "Submit"
    page.should_not have_content("Submit")
    page.should_not have_content("Sign Up")
    page.should have_content("You have been signed in")
    click_on "Sign Out"
    page.should have_content("You have been signed out")
    page.should have_content("Submit")
    page.should_not have_content("Sign Out")
  end

  scenario "Returning user attempts signin with incorrect password" do
    user = Fabricate(:user, name: "Bob")
    fill_in "Name", with: user.name
    fill_in "Password", with: "wrongpassword"
    click_button "Submit"
    page.should have_content("Invalid name or password.")
    page.should_not have_content("Welcome")
  end

  scenario "User signs in with wrong name" do
    Fabricate(:user, name: 'susie', email: "susie@example.com", password: "ThisIsAwesome", password_confirmation: "ThisIsAwesome")
    fill_in "Name", with: "SusieQ"
    fill_in("Password", with: "ThisIsAwesome")
    click_on "Submit"
    page.should have_content("Invalid name or password.")
  end

  scenario "User signs in with blanks" do
    click_on "Submit"
    page.should have_content("Invalid name or password.")
  end
end
