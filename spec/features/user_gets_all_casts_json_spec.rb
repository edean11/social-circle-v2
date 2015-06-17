feature "User gets all casts" do

  let!(:user){ Fabricate(:user) }
  let!(:foo_post){ Fabricate(:cast, user: user, title: "Foo", content: "Bar") }
  let!(:user2){ Fabricate(:user) }
  let!(:bar_post){ Fabricate(:cast, user: user2, title: "Foo2", content: "Bar2") }

  scenario "GET Full List of Casts" do
    visit casts_path+'.json'
    expect(page.source).to include('id')
    expect(page.source).to include('title')
    expect(page.source).to include('Foo')
    expect(page.source).to include('Bar')
    expect(page.source).to include('Foo2')
    expect(page.source).to include('Bar2')
  end

end