class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]
  require "rexml/document"
  include REXML

  # GET /cards
  # GET /cards.json
  def index
    #@cards = Card.all
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
  end

  # GET /cards/new
  def new
    @card = Card.new
    @prefectural = Prefectural.all
    @course = [Course.new(name: "学部を選択してください", id:"0")]
    @laboratory = [Laboratory.new(name: "学部を選択してください", id:"0")]
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards
  # POST /cards.json
  def create
    @card = Card.new(card_params)
    svg = REXML::Document.new(open("app/assets/images/test.svg"))
    forms = params.require(:card).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :department, :postalcode, :address_prefectural, :address_city, :address_street, :address_building, :tel, :email, :course, :laboratory, :free_text)

    svg.root.elements["//*[@id='text_firstname']"].text = forms[:first_name]
    svg.root.elements["//*[@id='text_lastname']"].text = forms[:last_name]
    svg.root.elements["//*[@id='text_schools']"].text = Department.find(forms[:department]).name
    svg.root.elements["//*[@id='text_lab']"].text = Laboratory.find(forms[:laboratory]).name
    svg.root.elements["//*[@id='text_tel']"].text = forms[:tel]
    svg.root.elements["//*[@id='text_mail']"].text = forms[:email]
    svg.root.elements["//*[@id='text_free']"].text = forms[:free]

    send_data(svg)

    #respond_to do |format|
    #  if @card.save
    #    format.html { redirect_to @card, notice: 'Card was successfully created.' }
    ##    format.json { render :show, status: :created, location: @card }
    #  else
    ##    format.html { render :new }
    #    format.json { render json: @card.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # PATCH/PUT /cards/1
  # PATCH/PUT /cards/1.json
  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to @card, notice: 'Card was successfully updated.' }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to cards_url, notice: 'Card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # from: http://qiita.com/inodev/items/9e08261c658c87cf777d
  def get_area
    records = Area.search_area(params[:search_code])
    render json: records
  end

  # cards/update_courses
  def update_courses
    @course = Course.where("department_id = ?", params[:department])
    respond_to do |format|
      format.js
    end
  end

  # cards/update_laboratories
  def update_laboratories
    @laboratory = Laboratory.where("department_id = ?", params[:department])
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params[:card]
    end
end
