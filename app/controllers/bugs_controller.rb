class BugsController < ApplicationController
  def index
    @bugs = Bug.all
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
  end

  private
    def bug_params
      params.require(:bug).permit(:service_twitter, :short_description, :long_description)
    end
end
