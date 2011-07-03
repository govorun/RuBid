class FopsController < ApplicationController
  # GET /fops
  # GET /fops.json
  def index
    @fops = Fop.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fops }
    end
  end

  # GET /fops/1
  # GET /fops/1.json
  def show
    @fop = Fop.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fop }
    end
  end

  # GET /fops/new
  # GET /fops/new.json
  def new
    @fop = Fop.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fop }
    end
  end

  # GET /fops/1/edit
  def edit
    @fop = Fop.find(params[:id])
  end

  # POST /fops
  # POST /fops.json
  def create
    @fop = Fop.new(params[:fop])

    respond_to do |format|
      if @fop.save
        format.html { redirect_to @fop, notice: 'Fop was successfully created.' }
        format.json { render json: @fop, status: :created, location: @fop }
      else
        format.html { render action: "new" }
        format.json { render json: @fop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fops/1
  # PUT /fops/1.json
  def update
    @fop = Fop.find(params[:id])

    respond_to do |format|
      if @fop.update_attributes(params[:fop])
        format.html { redirect_to @fop, notice: 'Fop was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @fop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fops/1
  # DELETE /fops/1.json
  def destroy
    @fop = Fop.find(params[:id])
    @fop.destroy

    respond_to do |format|
      format.html { redirect_to fops_url }
      format.json { head :ok }
    end
  end
end
