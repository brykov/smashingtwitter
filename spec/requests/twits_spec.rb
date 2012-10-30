require 'spec_helper'

describe "Twits" do
  describe "tweets controller" do
    it "redirects to home page if search query is empty" do
      get '/twits'
      response.should redirect_to('/')
    end

    it "displays tweets if query is provided" do
      get '/twits', q: 'twitter'
      response.should be_success
      assert_select 'ul.twits' do
        assert_select 'li .twit'
      end
    end

    it "contains search form with a search term" do
      get '/twits', q: 'twitter'
      response.should be_success
      assert_select '.form-search' do
        assert_select 'input.search-query[name=q][value=?]', 'twitter'
        assert_select 'button[type=submit]'
      end

    end

  end
end
