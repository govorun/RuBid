#encoding: utf-8
class FeedbacksController < ApplicationController
before_filter :authenticate_user!, :except => [:index]
before_filter :find_user

  def find_user
    @user = User.find(params[:user_id])
  end


  # GET /feedbacks
  # GET /feedbacks.json
  def index
    @feedbacks = @user.feedbacks.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @feedbacks }
    end
  end

  # GET /feedbacks/1
  # GET /feedbacks/1.json
  def show
    @feedback = @user.feedbacks.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @feedback }
    end
  end

  # GET /feedbacks/new
  # GET /feedbacks/new.json
  def new
    @feedback = Feedback.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @feedback }
    end
  end

  # GET /feedbacks/1/edit
  def edit
    @feedback = @user.feedbacks.find(params[:id])
  end

  # POST /feedbacks
  # POST /feedbacks.json
  def create
    @feedback = @user.feedbacks.build(params[:feedback])
    @feedback.author_id = current_user.id
    @feedback.author_name = current_user.name

    respond_to do |format|
      if @feedback.save

        format.html { redirect_to user_feedbacks_path(@user), notice: 'Feedback was successfully created.' }
        format.json { render json: @feedback, status: :created, location: @feedback }
      else
        format.html { render action: "new" }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /feedbacks/1
  # PUT /feedbacks/1.json
  def update
    @feedback = @user.feedbacks.find(params[:id])

    respond_to do |format|
      if @feedback.update_attributes(params[:feedback])
        format.html { redirect_to user_feedbacks_path(@user), notice: 'Feedback was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedbacks/1
  # DELETE /feedbacks/1.json
  def destroy
    @feedback = @user.feedbacks.find(params[:id])
    @feedback.destroy

    respond_to do |format|
      format.html { redirect_to user_feedbacks_path(@user) }
      format.json { head :ok }
    end
  end
end
