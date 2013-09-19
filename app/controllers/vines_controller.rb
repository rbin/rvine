class VinesController < ApplicationController
  # GET /vines
  # GET /vines.json
  def index
    @vines = Vine.all

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @vines }
    end
  end

  # GET /vines/1
  # GET /vines/1.json
  def show
    @vine = Vine.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @vine }
    end
  end

  def upvote
    @vine = Vine.find(params[:id])
    @vine.score = @vine.score += 1
    @vine.save
    redirect_to @vine
  end

  # GET /vines/new
  # GET /vines/new.json
  def new
    @vine = Vine.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @vine }
    end
  end

  # GET /vines/1/edit
  def edit
    @vine = Vine.find(params[:id])
  end

  # POST /vines
  # POST /vines.json
  def create
    @vine = Vine.new(params[:vine])

    respond_to do |format|
      if @vine.save
        format.html { redirect_to @vine, notice: 'Vine was successfully created.' }
        format.json { render json: @vine, status: :created, location: @vine }
      else
        format.html { render action: "new" }
        format.json { render json: @vine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vines/1
  # PUT /vines/1.json
  def update
    @vine = Vine.find(params[:id])
    @vine.update(params[:vine])
    redirect_to @vine
  end

  def secure_update
    update(:cas => meta["cas"])
  end

  # DELETE /vines/1
  # DELETE /vines/1.json
  def destroy
    @vine = Vine.find(params[:id])
    @vine.destroy

    respond_to do |format|
      format.html { redirect_to vines_url }
      format.json { head :no_content }
    end
  end
end
