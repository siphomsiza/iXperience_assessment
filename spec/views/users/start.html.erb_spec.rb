require 'rails_helper'

RSpec.describe "users/start.html.erb", :type => :view do
  it "renders the start form" do
    assign(:user, FactoryBot.build(:sign_up_step_one))
    render :template => "users/start.html.erb"
    expect(rendered).to match /First Name/
    expect(rendered).to match /Last Name/
    expect(rendered).to match /Email Address/
    expect(rendered).to match /Password Confirmation/
    expect(rendered).to match /Password/
  end

  it "matches the Rails environment by using symbols for keys" do
    [:controller, :action].each { |k| expect(controller.request.path_parameters.keys).to include(k) }
  end

  it "has a request.fullpath that is defined " do
    expect(controller.request.fullpath).to eq root_path
  end
end
