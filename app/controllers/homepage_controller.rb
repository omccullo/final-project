class HopageController < ApplicationController

  def homepage
    render(:template=>"general/homepage.html.erb")
  end
end
