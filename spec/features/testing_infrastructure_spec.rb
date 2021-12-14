feature 'Testing infrastructure' do
  scenario 'Can run app and check page content' do
    visit('/')
    expect(current_path).to eq('/users/new')
    expect(page).not_to have_content('Sinatra')
  end
end