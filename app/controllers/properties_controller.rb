require 'json'

class PropertiesController < ApplicationController
  before_action :set_property, only: %i[show edit update destroy]

  # GET /properties
  # GET /properties.json
  def index
    if !params[:property][:query].empty?
      @properties = Property.algolia_search(query_params)
    else
      @properties = Property.all
    end
  end

  def auto_complete
    str = params[:str]
    result = Property.search(str).take(5).uniq

    if result
      auto_com = []
      result.each do |prop|
        auto_com << prop.address
      end
      respond_to do |format|
        format.json { render json: auto_com.to_json }
      end
    else
      respond_to do |format|
        format.json { render json: json_format([]) }
      end
    end
  end

  # GET /properties/1
  # GET /properties/1.json
  def show; end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit; end

  # POST /properties
  # POST /properties.json
  def create
    @property = Property.new(property_params)
    @property.landlord_id = current_user.id

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_property
    @property = Property.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def property_params
    params.require(:property).permit(:kind_of_property, :title, :address, :map, :pictures, prop_images: [])
  end

  def query_params
    params.require(:property).permit(:query)
  end
end
