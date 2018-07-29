class StaticpagesController < ApplicationController
  before_action :setup_flickr, only: :index
  def index

  end

  def search
    args = {}
    args[:text] = params[:text]
    @images = flickr.photos.search(args).to_a[0..9].map {|img| FlickRaw.url img }
    puts @images
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
