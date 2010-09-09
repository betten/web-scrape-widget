require 'rubygems'
require 'hpricot'
require 'open-uri'

class ScrapesController < ApplicationController
	verify :params => :id, :only => [:get, :view], :redirect_to => '/'
	verify :params => [:url, :selector],
		:method => :post,
		:only => :test,
		:render => {:json => {'errors' => 'missing params. either that or you\'re trying a get request. nice try'}.to_json}
	verify :params => [:url, :selector],
		:method => :post,
		:only => :create,
		:add_flash => {'errors' => 'missing params!'},
		:redirect_to => '/'

	def get
		@scrape = Scrape.find_by_uid(params[:id])
		if @scrape.nil?
			render :nothing => true
			return false
		end
		@result = get_result(@scrape.url, @scrape.selector)
		render :layout => nil
	end

	def view
		@scrape = Scrape.find_by_uid(params[:id])
	end

	def create
		scrape = Scrape.new
		scrape.url = params[:url]
		scrape.selector = params[:selector]
		scrape.save
		redirect_to '/scrapes/view/' + scrape.uid
	end

	def home

	end

	def test
		result = get_result(params[:url], params[:selector])
		render :json => {'result' => result.to_s}.to_json	
	end

    private
	def get_result(url,selector)
		page = Hpricot(open(url))
		result = page.search(selector)
		return result
	end
end
