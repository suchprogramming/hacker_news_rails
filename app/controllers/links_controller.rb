class LinksController < ApplicationController

  def index
    @links = Link.all.order('link_score desc')
  end

  def new
    @link = Link.new
  end

  def show
    @link = Link.find(params[:id])
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      flash[:notice] = 'Link Succesfully Added'
      redirect_to links_path
    else
      render :new
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      flash[:notice] = 'Link successfully updated!'
      redirect_to links_path
    else
      render :edit
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    flash[:notice] = 'Link successfully deleted!'
    redirect_to links_path
  end

  def downvote
    @link = Link.find(params[:link_id])
    @link.link_score -= 1
    @link.save
    redirect_to links_path
  end

  private
  def link_params
    params.require(:link).permit(:name, :url, :link_score)
  end
end
