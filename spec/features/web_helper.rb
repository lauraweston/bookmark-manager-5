def add_bubbles_tag
  visit '/links/new'
  fill_in 'title', with: "Bubbles website"
  fill_in 'url', with: "https://bubblegame.org"
  fill_in 'tag', with: 'bubbles'
  click_button 'Submit'
end

def search_by_bubbles_tag
  fill_in 'tag', with: 'bubbles'
  click_button 'Search by tags'
end

def add_multiple_tags
  visit '/links/new'
  fill_in 'title', with: "Bubbles website"
  fill_in 'url', with: "https://bubblegame.org"
  fill_in 'tag', with: 'bubbles games'
  click_button 'Submit'
end

def sign_up
  visit "/"
  fill_in "email", with: "laura@makers.com"
  fill_in "password", with: "fghjklvgh"
  fill_in "password_confirmation", with: "fghjklvgh"
  click_button "Sign up"
end

def sign_up_mismatching_password
  visit "/"
  fill_in "email", with: "laura@makers.com"
  fill_in "password", with: "fghjklvgh"
  fill_in "password_confirmation", with: "8723tre2g"
  click_button "Sign up"
end
