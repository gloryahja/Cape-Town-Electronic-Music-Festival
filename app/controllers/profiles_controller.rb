class ProfilesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]



	def index 
	end

	def new
		# @profile = current_user.profile.build
		 @profile = Profile.new if current_user

		 respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profile }
    end
	end

	def show
		@profile = Profile.find(params[:id])
		@pictures = @profile.pictures

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profile }
    end
	end

	def edit
		@profile = Profile.find(params[:id])
	end


	def create
		@profile = current_user.build_profile(profile_params)

		respond_to do |format|
		if @profile.save
			if params[:images]
          # The magic is here ;)
          params[:images].each { |image|
            @profile.pictures.create(image: image)
          }
        end

        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render json: @profile, status: :created, location: @profile }
      else
        format.html { render action: "new" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

	def update
		@profile = Profile.find(params[:id])

		respond_to do |format|
		if @profile.update_attributes(profile_params)
        if params[:images]
          params[:images].each { |image|
            @profile.pictures.create(image: image)
          }
        end
        format.html { redirect_to @profile, notice: 'profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end
	

	private
		def profile_params
			params.require(:profile).permit(:name, :bio, :avatar, :cover_photo, :facebook, :twitter, :soundcloud, :embed, :pictures)
		end


end
