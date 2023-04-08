class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @posts = Post.all.order(created_at: :desc)
    @drops = Drop.all.order(created_at: :desc)
  end
end
