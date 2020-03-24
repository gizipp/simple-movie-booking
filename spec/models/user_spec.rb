RSpec.describe User do

  it { should have_secure_password }

  describe 'associations' do
   it { should have_many(:bookings) }
  end

  describe 'validations' do
    it 'has validates the presence of email' do
      user = User.new email: nil
      expect(user.valid?).to be_falsey
      expect(user.errors.details.include?(:email)).to be_truthy
    end

    it 'has validates the uniqueness of email' do
      User.create! email: 'gilang@gmail.com', password: 'password'
      user = User.new email: 'gilang@gmail.com'

      expect(user.valid?).to be_falsey
      expect(user.errors.details.include?(:email)).to be_truthy
    end

    it 'has validates the format of email' do
      user = User.new email: '@bad.email.com'

      expect(user.valid?).to be_falsey
      expect(user.errors.details.include?(:email)).to be_truthy
    end

    it 'has validates the presence of password' do
      user = User.new password: nil
      expect(user.valid?).to be_falsey
      expect(user.errors.details.include?(:password)).to be_truthy
    end

    it 'has validates the length of password' do
      user = User.new password: '1234567'
      expect(user.valid?).to be_falsey
      expect(user.errors.details.include?(:password)).to be_truthy
    end
  end
end
