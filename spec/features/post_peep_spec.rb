require 'peep'

feature 'Homepage loads with peeps' do
  
  scenario 'home has peeps' do
    peep_1 = Peep.create("Peep 1", '2020-04-10 10:52:57.960784', 'Bruce123')
    peep_2 = Peep.create("Peep 2", '2020-04-11 10:52:57.960784', 'Bruce123')
    visit '/home'
    expect(page).to have_content 'Peep 2 2020-04-11 Peep 1 2020-04-10'
  end

end