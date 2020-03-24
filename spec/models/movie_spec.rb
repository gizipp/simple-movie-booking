RSpec.describe Movie do

  describe 'associations' do
   it { should have_many(:screenings) }
   it { should have_many(:theatres) }
  end
end
