require 'spec_helper'

describe TwitsController do

  describe "twits page with no search query" do
    it "redirects to root path unless search string given" do
      get 'index'
      response.should redirect_to root_path
    end
  end

  describe "twits page with a query" do
    it "returns twits" do
      get 'index', q: 'twitter'
      response.should be_success
      assigns(:twits).should be_instance_of(Array)
      assigns(:max_id).should be_kind_of(Numeric)
    end
  end


end
