require 'spec_helper'

RSpec.describe User, :type => :model do
  let(:subject) {create(:user)}

  # Respond to attributes
  context "attrs for user" do
    it { expect(subject).to respond_to :first_name }
    it { expect(subject).to respond_to :last_name }
    it { expect(subject).to respond_to :email }
    it { expect(subject).to respond_to :birthday }
    it { expect(subject).to respond_to :gender }
    it { expect(subject).to respond_to :university }
  end
end
