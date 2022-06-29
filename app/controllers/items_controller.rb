class ItemsController < ApplicationController
  def index
  end

  def create
  end

  def create
    Tweet.create(tweet_params)
  end

  private
  def tweet_params
    params.require(:products).permit(:name, :image, :description)
  end
end
