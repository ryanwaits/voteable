class LinksController < ApplicationController
  before_action :find_link, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:show, :new, :create]

  def index
    @links = Link.all
  end

  def show
  end

  def new
    @link = Link.new
  end

  def create
    @link = current_user.links.build(link_params)
    if @link.save
      redirect_to links_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @link.destroy
    redirect_to :back
  end

  def upvote
    @link = Link.find(params[:id])
    @link.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @link = Link.find(params[:id])
    @link.downvote_by current_user
    redirect_to :back
  end

  private

  def require_login
    unless signed_in?
      redirect_to :back
    end
  end

  def find_link
    @link = Link.find(params[:id])
  end

  def link_params
    params.require(:link).permit(:title, :url)
  end
end