class ToppagesController < ApplicationController
  def index
    @groups = Group.all.limit(3)
    @bookposts = Bookpost.all.limit(4)
  end
end
