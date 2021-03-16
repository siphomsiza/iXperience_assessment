require 'spec_helper'

describe SignUpStepOne ,type: :model do
  let(:subject) {create(:sign_up_step_one)}
  # Respond to attributes
  context "attrs for user sign up step one " do
    it { expect(subject).to respond_to :first_name }
    it { expect(subject).to respond_to :last_name }
    it { expect(subject).to respond_to :email }
    it { expect(subject).to respond_to :password }
    it { expect(subject).to respond_to :password_confirmation }
  end

  # test validation
  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a first name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a last name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        subject.email = invalid_address
        expect(subject).not_to be_valid
      end
    end

    it 'validates uniqueness of email' do
      should validate_uniqueness_of(:email).case_insensitive
    end

    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "password is not valid should have minimum eight characters, at least one letter and one number" do
      subject.password = "123wers"
      subject.save
      expect(subject.errors[:password]).to include(a_string_matching(/minimum eight characters, at least one letter and one number/))
    end

    it "password is valid should have minimum eight characters, at least one letter and one number" do
      subject.password = "123TdaTHABA"
      subject.save
      expect(subject.errors[:password]).to match_array([])
    end

    it "is not valid without a password confirmation" do
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
    end

    describe "when password doesn't match confirmation" do
      before { subject.password_confirmation = "mismatch" }
      it "password confirmation it should not be valid" do
        expect(subject).to_not be_valid
      end
    end


  end
end
