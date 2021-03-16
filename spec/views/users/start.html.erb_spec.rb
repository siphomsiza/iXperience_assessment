require 'rails_helper'

RSpec.describe "users/start.html.erb", :type => :view do
  # before(:each) do
  #   let(:subject) {create(:sign_up_step_one)}
  # end
  # binding.pry
  it "renders the start form" do
     assert_select "form[action=?][method=?]", users_path(), "post" do
       assert_select "input#first_name[name=?]", "user[first_name]"
     end
  end
end
