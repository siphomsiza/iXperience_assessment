require 'rails_helper'

RSpec.describe "users/done.html.erb", :type => :view do
  it "renders the start form" do
    assign(:user, FactoryBot.build(:sign_up_step_two))
    render :template => "users/done.html.erb"
    expect(rendered).to match /First Name/
    expect(rendered).to match /Last Name/
  end

  it "displays the next with id: 1" do
    user = FactoryBot.create(:sign_up_step_two)
    controller.extra_params = { :id => user.id }
    expect(controller.request.fullpath).to eq done_user_path(user)
  end

  it "matches the Rails environment by using symbols for keys" do
    [:controller, :action].each { |k| expect(controller.request.path_parameters.keys).to include(k) }
  end

end
