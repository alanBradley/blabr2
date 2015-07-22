class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  # authentication on all methods except index and show pages so non-users cannot just bypass links to edit / destroy content
  before_filter :authenticate_user!, except: [:index, :show]

  # GET /links
  # GET /links.json
  def index
    # pulls all links vailable from the database
    @links = Link.all.order("links.updated_at DESC")
    # pulls all the locaton data from the databse to use in the links index page
    @locations = Location.all
    @users = current_user
  end

  # GET /links/1
  # GET /links/1.json
  def show
  end

  # GET /links/new
  def new
    # builds out a link from the current user instead of just a new link
    # @link = Link.new
    @link = current_user.links.build
    # builds an address form-field location for the locations model
    @link.locations.build
  end

  # GET /links/1/edit
  def edit
  end

  # POST /links
  # POST /links.json
  def create
    # @link = Link.new(link_params)
    @link = current_user.links.build(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    # find link using parameter id
    @link = Link.find(params[:id])
    # send upvote by the current user to db
    @link.upvote_by current_user
    # set redirect to current page
    redirect_to :back
  end

  def downvote
     # find link using parameter id
    @link = Link.find(params[:id])
    # send downvote by the current user to db
    @link.downvote_by current_user
    # set redirect to current page
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # added locations_attributes in link_params to add address from links form to the locations model
    def link_params
      params.require(:link).permit(:title, :url, :image, locations_attributes: [:address, :_destroy])
    end
end
