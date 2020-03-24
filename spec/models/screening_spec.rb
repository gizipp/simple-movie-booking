RSpec.describe Screening do

  describe 'associations' do
   it { should belong_to(:movie) }
   it { should belong_to(:theatre) }
   it { should have_many(:bookings) }
  end

  describe '#start_time' do
    it 'return start time in hour and minutes format' do
      theatre = Theatre.create! name: 'Theatre 1'
      movie = Movie.create! name: 'Movie 1'
      screening = Screening.create! start_at: "14:00", theatre: theatre, movie: movie
      expect(screening.start_time).to eq("14:00")
    end
  end

  describe '#booked?' do
    it 'return false when user not yet certain booking movie screening' do
      theatre = Theatre.create! name: 'Theatre 1'
      movie = Movie.create! name: 'Movie 1'
      screening = Screening.create! start_at: "14:00", theatre: theatre, movie: movie
      user = User.create! password: 'password', email: 'email@jlkasd.com'
      expect(screening.booked?(user.id)).to be_falsey
    end

    it 'return true when user booking certain movie screening' do
      theatre = Theatre.create! name: 'Theatre 1'
      movie = Movie.create! name: 'Movie 1'
      screening = Screening.create! start_at: "14:00", theatre: theatre, movie: movie
      user = User.create! password: 'password', email: 'email@jlkasd.com'
      Booking.create! user: User.first, screening: screening
      expect(screening.booked?(user.id)).to be_truthy
    end
  end

  describe '#in_the_past?' do
    before do
      travel_to Time.now.midday
    end

    after do
      travel_back
    end

    it 'return true when movie screening already passed screening time' do
      theatre = Theatre.create! name: 'Theatre 1'
      movie = Movie.create! name: 'Movie 1'
      screening = Screening.create! start_at: "11:00", theatre: theatre, movie: movie
      expect(screening.in_the_past?).to be_truthy
    end

    it 'return false when movie screening not yet passed screening time' do
      theatre = Theatre.create! name: 'Theatre 1'
      movie = Movie.create! name: 'Movie 1'
      screening = Screening.create! start_at: "22:00", theatre: theatre, movie: movie

      expect(screening.in_the_past?).to be_falsey
    end
  end

  describe '#seat_available' do
    it 'return number of available seat for related movie screening' do
      capacity = 50
      theatre = Theatre.create! name: 'Theatre 1', capacity: capacity
      movie = Movie.create! name: 'Movie 1'
      screening = Screening.create! start_at: "22:00", theatre: theatre, movie: movie
      expect(screening.seat_available).to eq(capacity)
    end
  end

  describe '#seat_available?' do
    it 'return of availability for related movie screening' do
      capacity = 1
      theatre = Theatre.create! name: 'Theatre 1', capacity: capacity
      movie = Movie.create! name: 'Movie 1'
      screening = Screening.create! start_at: "22:00", theatre: theatre, movie: movie
      user = User.create! password: 'password', email: 'email@jlkasd.com'
      expect(screening.seat_available?).to be_truthy
      Booking.create! user: User.first, screening: screening
      expect(screening.seat_available?).to be_falsey
    end
  end
end
