class LinksController < ApplicationController
  def index
    @link = Link.new
    @links = Link.all
  end

  def create
    Link.create(link_params)
    redirect_to root_path
  end

  def short_link
    link = Link.find_by(uid: params[:link_uid])
    if link.present?
      link.update(count: link.count + 1)
      redirect_to link.url
    else
      redirect_to root_path
    end
  end

  private

    def link_params
      params.require(:link).permit(:url)
    end
end
