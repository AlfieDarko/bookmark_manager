feature 'Update Links' do
  scenario 'when updating any links' do
    visit('/')
    click_link 'edit_button4'
    fill_in 'new_url4', with: 'http://testlink.com'
    fill_in 'new_title4', with: 'Test Linksyyy'
    click_button 'submit_4'
    expect(page).to have_content 'Test Linksyyy'
  end
end
