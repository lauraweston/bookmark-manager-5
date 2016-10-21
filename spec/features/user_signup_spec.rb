
feature "Users" do
  scenario "sign up for a new account" do
    sign_up
    expect(page).to have_content "Welcome laura@makers.com"
    expect(User.count).to eq 1
    expect(User.first.email).to eq "laura@makers.com"
  end
end

feature "Users" do
  scenario "sign up for a new account" do
    expect { sign_up_mismatching_password }.not_to change(User, :count)
  end
end
