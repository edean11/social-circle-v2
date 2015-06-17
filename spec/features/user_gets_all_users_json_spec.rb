feature "User gets all users" do

  let!(:user){ Fabricate(:user, name: 'Jeff') }
  let!(:user2){ Fabricate(:user, name: 'Sally') }

  scenario "GET Full List of Users" do
    visit users_path+'.json'
    expect(page.source).to include('Jeff')
    expect(page.source).to include('Sally')
  end

end