class WikisController < ApplicationController
  def index
    @wikis = Wiki.all 
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new 
  end

  def edit
  end

  def create
    @wiki = Wiki.new
    @wiki.user = current_user
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]

    if @wiki.save!
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki 
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :new 
    end
  end
end
