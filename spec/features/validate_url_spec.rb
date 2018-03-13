feature 'validate links' do
  scenario 'user adds invalid link' do
    visit('/')
    fill_in 'add_link', with: 'htp::/wesbos.com'
    click_button 'submit_link'
    expect(page).to have_content 'Invalid URL'
  end
end
