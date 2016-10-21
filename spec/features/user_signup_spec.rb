
feature "Sign up" do
  scenario "sign up for a new account" do
    sign_up
    expect(page).to have_content "Welcome laura@makers.com"
    expect(User.count).to eq 1
    expect(User.first.email).to eq "laura@makers.com"
  end
end

feature "Sign up" do
  scenario "can't sign up if passwords do not match" do
    expect { sign_up_mismatching_password }.not_to change(User, :count)
    expect(current_path).to eq('/')
    expect(page).to have_content "Password and confirmation password do not match"

  end
end
