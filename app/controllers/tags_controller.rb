class TagsController < ApplicationController
  before_action :set_tag

  def show
    tag = Tag.find(params[:id])
    @dashboard = Dashboard.new(user: current_user, posts: tagged_posts, tag: @tag)
    render 'dashboards/show'
  end

  private

    def set_tag
      @tag = Tag.find(params[:id])
    end

    def tagged_posts
      Post.tagged_with(@tag.name)
    end
end