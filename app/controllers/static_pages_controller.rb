class StaticPagesController < ApplicationController

  before_filter { set_body_id "pages" }

  def index
    set_body_class "homepage"
    
    if signed_in?
      redirect_to receipts_url
    end
    
  end

end
