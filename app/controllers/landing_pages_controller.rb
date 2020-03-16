class LandingPagesController < ApplicationController
  def welcome
    @latests = Property.last(4)
  end

  def about
  end

  def landlord
  end

  def tenant
  end
end
