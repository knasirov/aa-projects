require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page"  do
    visit new_user_url
    expect(page).to have_content("Sign Up!!")
  end

  feature "signing up a user" do

    scenario "shows username on the user show page after signup" do
      sign_up
      expect(page).to have_content("Superman")
    end

  end

end

feature "logging in" do

  scenario "shows username on the homepage after login" do
    sign_in
    expect(page).to have_content("Superman")
  end

end

feature "logging out" do
  before { sign_in }
  scenario "begins with a logged out state" do
    click_on "Sign Out"

  end

  scenario "doesn't show username on the homepage after logout" do
    click_on "Sign Out"
    visit users_url
    expect(page).not_to have_content("Superman", count: 2)
  end
end
