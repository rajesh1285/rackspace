class FriendshipsController < ApplicationController
before_action :authenticate_user!
before_action :correct_user ,only: [:edit,:update,:destroy]
require 'open-uri'

	def index
		@friendships = Friendship.search(params[:search])
	end
	
	def create
		# @friendship = Friendship.create(friendship_params)
		@friendship = current_user.friendships.build(friendship_params)
		grab
		if @friendship.save
			redirect_to friendships_path
		else
			render 'new'
		end
	end

	def new
		# @friendship = Friendship.new
		@friendship = current_user.friendships.build
	end
	
	def show
		@friendship = Friendship.find(params[:id])
		# @friendship = Friendship.generate_short_url
		# @url = @friendship.website_url
		# @short_url = @url.generate_short_url
	end
	# def short_url
	# 	friend = Friendship.generate_short_url(params[:website_url])
	# 	@friendship.description = friend
	# end
	def edit
		@friendship = Friendship.find(params[:id])
	end

	def update
		@friendship = Friendship.find(params[:id])
		if @friendship.update(friendship_params)
	      redirect_to @friendship
	    else
	      render 'edit'
	    end
	end

	def destroy
		@friendship = Friendship.find(params[:id])
		@friendship.destroy
		redirect_to friendships_path
	end

	def correct_user
		@friendship = current_user.friendships.find_by(id: params[:id])
		redirect_to friendships_path ,notice: "Not autherized" if @friendship.nil?
	end

	def grab
	    doc = Nokogiri::HTML(open(friendship_params["website_url"]))
	    name = doc.title
	    @friendship.titile = name
  	end
  	
	private
	def friendship_params
    	params.require(:friendship).permit(:name, :website_url,:title,:description,:user_id)
  	end
end
