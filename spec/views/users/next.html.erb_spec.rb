require 'rails_helper'

RSpec.describe "users/next.html.erb", :type => :view do
  it "renders the start form" do
    assign(:user, FactoryBot.build(:sign_up_step_one))
    render :template => "users/next.html.erb"
    expect(rendered).to match /Birthday/
    expect(rendered).to match /gender/
    expect(rendered).to match /University/
  end

  it "displays the next with id: 1" do
    user = FactoryBot.create(:sign_up_step_one)
    controller.extra_params = { :id => user.id }
    expect(controller.request.fullpath).to eq next_user_path(user)
  end

  it "matches the Rails environment by using symbols for keys" do
    [:controller, :action].each { |k| expect(controller.request.path_parameters.keys).to include(k) }
  end

  it "has a request.fullpath that is defined " do
    user = FactoryBot.create(:sign_up_step_one)
    controller.extra_params = { :id => user.id }
    expect(controller.request.fullpath).to eq next_user_path(user)
  end
end
