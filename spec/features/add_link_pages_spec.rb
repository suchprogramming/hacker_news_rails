require 'rails_helper'

describe "the add a link process" do
  it "adds a new link" do
    visit links_path
    click_on 'Create New Link'
    fill_in 'Name', :with => 'Cool Story'
    fill_in 'Url', :with => 'www.google.com'
    click_on 'Create Link'
    expect(page).to have_content 'Links'
  end
end
