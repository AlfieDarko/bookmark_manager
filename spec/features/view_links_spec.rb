feature 'View Links' do
  scenario ' when requested by user, display links ' do
    visit('/')
    expect(page).to have_content 'Makers Academy'
    expect(page).to have_content 'Google'
    expect(page).to have_content 'Facebook'
  end
end
