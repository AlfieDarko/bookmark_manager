feature 'validate links' do
  scenario 'user adds invalid link' do
    visit('/')
    fill_in 'add_link', with: 'htp::/wesbos.com'
    click_button 'submit_link'
    expect(page).to have_content 'Incorrect URL! Try again'
  end

  scenario 'user adds valid link' do
    visit('/')
    fill_in 'add_link', with: 'http://www.wesbos.com'
    click_button 'submit_link'
    expect(page).to have_content 'URL added to Bookie!'
  end
end
