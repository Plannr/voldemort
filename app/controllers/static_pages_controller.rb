class StaticPagesController < ApplicationController
  def index
    if signed_in?
        redirect_to receipts_url
    end
  end
end
