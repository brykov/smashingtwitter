require 'spec_helper'

describe "Home page" do
  describe "search form" do
    it "contains a search form" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get '/'
      response.should be_success
      assert_select '.form-search' do
        assert_select 'input.search-query[name=q]'
        assert_select 'button[type=submit]'
      end
    end

  end
end
