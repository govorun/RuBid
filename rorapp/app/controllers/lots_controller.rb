#encoding: utf-8
class LotsController < ApplicationController
before_filter :authenticate_user!, :except => [:index]
before_filter :find_lot, :except => [:index, :new, :create]
before_filter :authorise_as_owner!, :except => [:index, :new, :create, :show]
before_filter :find_user, :except => [:index]

  def find_lot
    @lot = Lot.find(params[:id])
  end

  def find_user
    @user = User.find(current_user.id)
  end

  # GET /lots
  # GET /lots.json
  def index

    if params[:user_id]
      @user = User.find(params[:user_id])
      @lots = @user.lots.all
      @title = "Список лотов пользователя #{@user.name}"
    else
      @lots = Lot.all
      @title = "Список лотов"
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lots }
    end
  end

  # GET /lots/1
  # GET /lots/1.json
  def show
    @title = "Лот: "+@lot.title

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lot }
    end
  end

  # GET /lots/new
  # GET /lots/new.json
  def new
    @lot = Lot.new

    @title = "Создание нового лота"

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lot }
    end
  end

  # GET /lots/1/edit
  def edit
    @lot = Lot.find(params[:id])
    @title = "Правка лота"
  end

  # POST /lots
  # POST /lots.json
  def create

    @lot = @user.lots.build(params[:lot])

    respond_to do |format|
      if @lot.save
        format.html { redirect_to @lot, notice: 'Lot was successfully created.' }
        format.json { render json: @lot, status: :created, location: @lot }
      else
        format.html { render action: "new" }
        format.json { render json: @lot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lots/1
  # PUT /lots/1.json
  def update
    respond_to do |format|
      if @lot.update_attributes(params[:lot])
        format.html { redirect_to @lot, notice: 'Lot was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @lot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lots/1
  # DELETE /lots/1.json
  def destroy
    @lot.destroy

    respond_to do |format|
      format.html { redirect_to lots_url }
      format.json { head :ok }
    end
  end

  def authorise_as_owner!
    unless current_user.try(:admin?) || @lot.user_id == current_user.id
      flash[:alert]  = "Not your lot!"
      redirect_to ''
    end
  end



end
