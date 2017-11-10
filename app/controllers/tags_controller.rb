class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
    @goals_sample = @tag.goals.where(private: false).sample(5)
  end
end
