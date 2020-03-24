RSpec.describe Theatre do

  describe 'associations' do
   it { should have_many(:screenings) }
  end
end
