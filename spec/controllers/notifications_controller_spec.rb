require 'spec_helper'

describe NotificationsController do

  describe "GET 'contact'" do
    it "returns http success" do
      get 'contact'
      expect(response).to be_success
    end
  end

end
