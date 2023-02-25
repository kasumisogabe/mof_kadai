class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy ]

  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
    # @property.closest_stations.new
    2.times { @property.closest_stations.build }
  end

  def create
    @property = Property.new(property_params)
    return render :new if params[:back]
    if @property.save
      redirect_to properties_path, notice: '物件情報をを登録しました'
    else
      render :new
    end
  end

  def show
    @closest_stations = @property.closest_stations
  end

  def edit
    @property.closest_stations.build
  end

  def update
    if @property.update(property_params)
      redirect_to properties_path, notice: "物件情報を編集しました!"
    else
      render :edit
    end
  end

  def destroy
    @property.destroy
    redirect_to properties_path, notice: "物件情報を削除しました!"
  end

  def confirm
    @property = Property.new(property_params)
    render :new if @property.invalid?
  end

  private
    def set_property
      @property = Property.find(params[:id])
    end

    def property_params
      params.require(:property).permit(:name, :rent, :adress, :age, :note, 
      closest_stations_attributes: [:line_name, :station, :time, :id, :_destroy])
    end
end
