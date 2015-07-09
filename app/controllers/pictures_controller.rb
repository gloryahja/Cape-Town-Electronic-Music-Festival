class PicturesController < ApplicationController
  # GET /pictures
  # GET /pictures.json
  def index

    @profile = Profile.find(params[:profile_id])

    @pictures = @profile.pictures

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pictures }
    end
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @picture = Picture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /pictures/new
  # GET /pictures/new.json
  def new
    @profile = Profile.find(params[:profile_id])
    @picture = @profile.pictures.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /pictures/1/edit
  def edit
    #@profile = profile.find(params[:profile_id])

    @picture = Picture.find(params[:id])
    # @picture = Picture.find(params[:id])
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = Picture.new(params[:picture])

    if @picture.save
      respond_to do |format|
        format.html {
          render :json => [@picture.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json {
          render :json => [@picture.to_jq_upload].to_json
        }
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  # PUT /pictures/1
  # PUT /pictures/1.json
  def update

    @profile = current_user.profile

    @picture = Picture.find(params[:id])

    # respond_to do |format|
      if @picture.update_attributes(picture_params)

        redirect_to current_user.profile
      else
        # format.html { render action: "edit" }
        # format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    # end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    #@profile = profile.find(params[:profile_id])
    #@picture = @profile.pictures.find(params[:id])
    @picture = Picture.find(params[:id])
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to current_user.profile }
      format.js
    end
  end

  def make_default
    @picture = Picture.find(params[:id])
    @profile = Profile.find(params[:profile_id])

    @profile.cover = @picture.id
    @profile.save

    respond_to do |format|
      format.js
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:description, :profile_id, :image)
  end
end
