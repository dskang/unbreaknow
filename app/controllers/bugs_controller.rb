class BugsController < ApplicationController
  def index
    @bugs = Bug.order("created_at DESC").first 10
  end

  def new
    @bug = Bug.new
  end

  def create
    @bug = Bug.new(bug_params)

    if @bug.save
      redirect_to @bug, notice: 'Bug was successfully created'
    else
      render action: 'new'
    end
  end

  def show
    @bug = Bug.find(params[:id])

    twitter_params = {}
    twitter_params[:url] = request.original_url
    twitter_params[:hashtags] = 'unbreaknow'
    twitter_params[:text] = "Unbreak @#{@bug.service_twitter} by #{@bug.short_description}"
    @twitter_params = twitter_params.to_query
  end

  private
    def bug_params
      params.require(:bug).permit(:service_twitter, :short_description, :long_description)
    end
end
