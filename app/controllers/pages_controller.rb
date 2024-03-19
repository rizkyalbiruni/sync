class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @group = Group.new
    @topics = Topic.all
  end
end
