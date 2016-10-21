
feature "Users" do
  scenario "sign up for a new account" do
    visit "/"
    fill_in "email", with: "laura@makers.com"
    fill_in "password", with: "fghjklvgh"
    click_button "Sign up"

    expect(page).to have_content "Welcome laura@makers.com"
    expect(User.count).to eq 1
    expect(User.first.email).to eq "laura@makers.com"
  end
end
