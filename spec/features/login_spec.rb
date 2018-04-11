require 'rails_helper'

RSpec.feature "login in" do
  background do
  end

  scenario "The login page exists" do
    visit new_user_session_path
  end
end
