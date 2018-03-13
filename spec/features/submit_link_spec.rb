feature 'Submit Link' do
  scenario 'clicks button to add' do
    visit('/')
    fill_in 'add_link', with: 'http://testlink.com'
    fill_in 'add_title', with: 'Test Link'
    click_button 'submit_link'
    expect(page).to have_content 'Test Link'
  end
end
