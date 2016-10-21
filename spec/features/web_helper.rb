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
