feature 'View Links' do
  scenario ' when requested by user, display links ' do
    visit('/')
    expect(page).to have_content 'http://makersacademy.com'
    expect(page).to have_content 'http://google.com'
    expect(page).to have_content 'http://facebook.com'
  end
end
