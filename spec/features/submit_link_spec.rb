feature 'Submit Link' do
  scenario 'clicks button to add' do
    visit('/')
    fill_in 'add_link', with: 'http://ign.com'
    click_button 'submit_link'
    expect(page).to have_content 'http://ign.com'
  end
end
