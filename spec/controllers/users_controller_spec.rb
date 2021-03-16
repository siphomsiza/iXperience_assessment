require 'spec_helper'

RSpec.describe UsersController, :type => :controller do
  routes { Rails.application.routes}
  describe "GET start" do
    it "returns http success" do
      get :start
      expect(response.status).to eq(200)
      expect(response).to be_successful
    end
  end

  # describe "GET next" do
  #   let(:subject) {create(:sign_up_step_one)}
  #   it "returns http success" do
  #     params = {:id => subject.id}
  #     get  user_path(params)
  #     expect(response).to be_successful
  #   end
  # end

  # describe "GET done" do
  #   it "returns http success" do
  #     get :done
  #     expect(response).to be_successful
  #   end
  # end

end
