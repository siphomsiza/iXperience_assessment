require 'spec_helper'

describe SignUpStepTwo ,type: :model do
  let(:subject) {create(:sign_up_step_two)}

  # Respond to attributes
  context "attrs for user sign up step one " do
    it { expect(subject).to respond_to :gender }
    it { expect(subject).to respond_to :birthday }
    it { expect(subject).to respond_to :university }
  end

  # test validation
  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a gender" do
      subject.gender = nil
      expect(subject).to_not be_valid
    end

    it "gender is not valid should have include Male Female Non-binary)" do
      subject.gender = "GAY"
      subject.save
      expect(subject.errors[:gender]).to include(a_string_matching(/GAY is not a valid gender/))
    end

    it "is not valid without a birthday" do
      subject.birthday = nil
      expect(subject).to_not be_valid
    end

    it "birthday should be lessthan 150 years old." do
      subject.birthday = 151.years.ago.to_date
      subject.save
      expect(subject.errors[:birthday]).to include(a_string_matching(/#{subject.birthday} should be lessthan 150 years old./))
    end

    it "is not valid without a university" do
      subject.university = nil
      expect(subject).to_not be_valid
    end
  end
end
