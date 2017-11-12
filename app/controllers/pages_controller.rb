class PagesController < ApplicationController
  def index
    @goals_sample = Goal.where(private: false).sample(5)
  end

  def about
  end

end