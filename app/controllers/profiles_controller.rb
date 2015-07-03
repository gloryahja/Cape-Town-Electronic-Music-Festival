class ProfilesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]


# after_sign_in

# end


	def index 
	end

	def new
		# @profile = current_user.profile.build
		 @profile = Profile.new if current_user
	end

	def show
		@profile = Profile.find(params[:id])
	end

	def edit
		@profile = Profile.find(params[:id])
	end


	def create
		@profile = current_user.build_profile(profile_params)
		if 
			@profile.save
			redirect_to @profile
		else
			render 'new'
		end
	end

	def update
		@profile = Profile.find(params[:id])

		if @profile.update(profile_params)
			redirect_to @profile
		else
			render 'edit'
		end
	end
	

	private
		def profile_params
			params.require(:profile).permit(:name, :bio, :avatar, :cover_photo, :facebook, :twitter, :soundcloud, :embed)
		end


end
