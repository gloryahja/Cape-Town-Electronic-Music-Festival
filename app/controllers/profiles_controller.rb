class ProfilesController < ApplicationController
	def index 
	end

	def new
		@profile = Profile.new
	end

	def create
		#the :profile comes from the :profile in the form that was created in new.html.erb
		@profile = Profile.new(profile_params)
		if 
			@profile.save
			redirect_to @profile
		else
			render 'new'
		end
	end

	def show
		@profile = Profile.find(params[:id])
	end

	private
		def profile_params
			params.require(:profile).permit(:name, :bio, :avatar, :cover_photo, :facebook, :twitter, :soundcloud)
		end


end
