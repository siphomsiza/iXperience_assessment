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

  describe "GET next" do
    let(:subject) {create(:sign_up_step_one)}
    it "returns http success for next page" do
      get :next, params: { id: subject.id }
      expect(response.status).to eq(200)
      expect(response).to be_successful
    end
  end

  describe "create user responds to" do
    it "responds to html by default" do
      post :create, :params => { :user => { :first_name => "User create" } }
      expect(response.content_type).to eq "text/html; charset=utf-8"
    end
  end

  describe "with invalid arguments for create a user" do
    before(:each) do
      request.env["HTTP_REFERER"] = users_path
    end

    it "should return a non-empty list of errors" do
      post 'create', :params => { :user => { :first_name => "" } }
      expect(assigns(:user).errors).to_not be_empty
    end
  end

  describe "update user responds to" do
    let(:subject) {create(:sign_up_step_one)}
    it "update responds to html by default" do
      post :update, :params => { :user => { :first_name => "Update User Name" },id: subject.id }
      expect(response.content_type).to eq "text/html; charset=utf-8"
    end
  end

  describe "with invalid arguments for update a user" do
    let(:subject) {create(:sign_up_step_one)}
    before(:each) do
      request.env["HTTP_REFERER"] = users_path
    end

    it "should return a non-empty list of errors" do
      post 'update', :params => { :user => { :first_name => "" } ,id: subject.id}
      expect(assigns(:user).errors).to_not be_empty
    end
  end

  describe "GET done" do
    let(:subject) {create(:sign_up_step_one)}
    it "returns http success for done page" do
      get :done, params: { id: subject.id }
      expect(response.status).to eq(200)
      expect(response).to be_successful
    end
  end

end
