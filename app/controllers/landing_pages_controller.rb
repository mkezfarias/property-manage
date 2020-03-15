class LandingPagesController < ApplicationController
  def welcome
    @latest = Property.last
  end

  def about
  end

  def landlord
  end

  def tenant
  end
end
