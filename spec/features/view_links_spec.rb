feature 'View Links' do
  scenario ' when requested by user, display links ' do
    visit('/')
    expect(page).to have_content 'http://www.makersacademy.com'
    expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'http://www.facebook.com'
  end
end
