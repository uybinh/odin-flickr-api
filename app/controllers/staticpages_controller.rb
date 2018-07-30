class StaticpagesController < ApplicationController
  before_action :setup_flickr, only: :index
  def index

  end

  def search
    args = {}
    num_images = params[:search][:num_images].to_i
    args[:text] = params[:search][:text]
    @images = flickr.photos.search(args).to_a.slice(0,num_images)

    respond_to do |format|
      format.js
    end
  end

  private

  def setup_flickr
    FlickRaw.api_key = ENV['FLICKRAW_API_KEY']
    FlickRaw.shared_secret = ENV['FLICKRAW_SHARED_SECRET']
    flickr = FlickRaw::Flickr.new
  end
end
