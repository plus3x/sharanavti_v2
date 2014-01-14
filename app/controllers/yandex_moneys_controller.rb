class YandexMoneysController < ApplicationController
  before_action :set_yandex_money, only: [:show, :edit, :update, :destroy]

  # GET /yandex_moneys
  # GET /yandex_moneys.json
  def index
    @yandex_moneys = YandexMoney.all
  end

  # GET /yandex_moneys/1
  # GET /yandex_moneys/1.json
  def show
  end

  # GET /yandex_moneys/new
  def new
    @yandex_money = YandexMoney.new
  end

  # GET /yandex_moneys/1/edit
  def edit
  end

  # POST /yandex_moneys
  # POST /yandex_moneys.json
  def create
    @yandex_money = YandexMoney.new(yandex_money_params)

    respond_to do |format|
      if @yandex_money.save
        format.html { redirect_to @yandex_money, notice: 'Yandex money was successfully created.' }
        format.json { render action: 'show', status: :created, location: @yandex_money }
      else
        format.html { render action: 'new' }
        format.json { render json: @yandex_money.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yandex_moneys/1
  # PATCH/PUT /yandex_moneys/1.json
  def update
    respond_to do |format|
      if @yandex_money.update(yandex_money_params)
        format.html { redirect_to @yandex_money, notice: 'Yandex money was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @yandex_money.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yandex_moneys/1
  # DELETE /yandex_moneys/1.json
  def destroy
    @yandex_money.destroy
    respond_to do |format|
      format.html { redirect_to yandex_moneys_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yandex_money
      @yandex_money = YandexMoney.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def yandex_money_params
      params.require(:yandex_money).permit(:user_id, :customerid, :sum, :gems, :invoiceid)
    end
end
