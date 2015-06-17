feature "User gets all owned casts" do

  let!(:user){ Fabricate(:user) }
  let!(:foo_post){ Fabricate(:cast, user: user, title: "Foo", content: "Bar") }
  let!(:bar_post){ Fabricate(:cast, user: user, title: "Foo2", content: "Bar2") }

  scenario "GET All Owned Casts" do
    visit casts_path+'.json'
    expect(page.source).to include('id')
    expect(page.source).to include('title')
    expect(page.source).to include('Foo')
    expect(page.source).to include('Bar')
    expect(page.source).to include('Foo2')
    expect(page.source).to include('Bar2')
  end

end