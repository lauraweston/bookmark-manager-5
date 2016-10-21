require './app/models/link'

feature 'filtering tags' do
  scenario 'filters links by tag' do
    add_bubbles_tag
    search_by_bubbles_tag

    expect(page).to have_content("Bubbles website")
  end
end

feature 'add multiple tags' do
  scenario 'add more than one tag to a link' do
  add_multiple_tags
  link = Link.first
  expect(link.tags.map(&:tag)).to include('bubbles')
  expect(link.tags.map(&:tag)).to include('games')
  end
end
