class StaticPagesController < ApplicationController
  skip_before_action :authorize

  def about_game
    @posts = Post.all.reverse
  end

  def about_company
    @posts = Post.all.reverse
  end

  def contacts
  end

  def offer
  end

  def user_agreement
  end

  def security
  end

  def protection
  end
end
