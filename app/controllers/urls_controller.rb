class UrlsController < ApplicationController
  def new
    @url = Url.new
  end

  def create
    url = Url.new(url_params)
    if url.save
      url.update(id_url: url.generate_id_url)
      redirect_to urls_path
    else
      render 'new'
    end
  end

  def index
    @urls = Url.all
  end

  def show
    puts "Test"
  end

  private

  def url_params
    params.require(:url).permit(:original_url)
  end
end
