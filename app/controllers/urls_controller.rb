class UrlsController < ApplicationController
  before_action :id_url_exists?, only: [:show]

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      @url.update(id_url: @url.generate_id_url)
      redirect_to urls_path
    else
      render 'new'
    end
  end

  def index
    @urls = Url.all
  end

  def show
    @url = find_url

    redirect_to @url.original_url
  end

  private

  def find_url
    Url.find_by(id_url: params[:id_url])
  end

  def id_url_exists?
    redirect_to urls_path unless !find_url.nil?
  end

  def url_params
    params.require(:url).permit(:original_url)
  end
end
