require 'net/http'
require 'uri'
require 'json'

class RestaurantsController < ApplicationController

  def new

  end

  def search

    url = URI.parse(URI.escape("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=b92bb904c1086145&name=#{params[:name]}&middle_area=#{params[:area]}&count=3&format=json"))
    res = Net::HTTP.start(url.host, url.port){|http|
        http.get(url.path + "?" + url.query);
    }

    results = JSON.parse(res.body)
    @restaurants = results['results']['shop']

    respond_to do |format|
      format.html
      format.json
    end

  end

  def register
    url = URI.parse(URI.escape("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=b92bb904c1086145&id=#{params[:id]}&format=json"))
    res = Net::HTTP.start(url.host, url.port){|http|
        http.get(url.path + "?" + url.query);
    }

    results = JSON.parse(res.body)
    @restaurant = results['results']['shop']
    current_user.restaurants.create(name: @restaurant[0]["name"], address: @restaurant[0]["address"], image: @restaurant[0]["photo"]["mobile"]["s"], url: @restaurant[0]["urls"]["pc"])

    redirect_to user_path(current_user.id)
  end

end
