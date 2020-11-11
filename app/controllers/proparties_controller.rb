class PropartiesController < ApplicationController
  before_action :set_proparty,only:[:show, :edit, :destroy, :update]
  def index
    @proparty = Proparty.all
  end
  def new
    @proparty = Proparty.new
    2.times { @proparty.near_stations.build }
  end
  def create
    @proparty = Proparty.new(proparty_params)
    if @proparty.save
      redirect_to proparties_path, notice: "物件を登録しました。"
    else
      render :new
    end
  end
  def show
    @near_station = @proparty.near_stations
  end
  def edit
    if @proparty.near_stations.index.count == 0
      @proparty.near_stations.build
    else
      if @proparty.near_stations.last.route_name.present? &&
         @proparty.near_stations.last.station_name.present? &&
         @proparty.near_stations.last.minutes.present?
        @proparty.near_stations.build
      end
    end
  end
  def destroy
    @proparty.destroy
    redirect_to proparties_path,notice: "物件情報を削除しました。"
  end
  def update
    if @proparty.update(proparty_params)
      redirect_to proparties_path, notice: "物件情報を編集しました。"
    else
      render :edit
    end
  end
  private
  def proparty_params
    params.require(:proparty).permit(:name, :price, :address,
                                   :age, :content,
                                   near_stations_attributes:[
                                     :id,
                                     :route_name,
                                     :station_name,
                                     :minutes,
                                     :propaty_id,
                                     :_destroy
                                   ]
                                 )
  end
  def set_proparty
    @proparty = Proparty.find(params[:id])
  end
end
