class LacresController < ApplicationController
  
  before_filter :liberarAcesso, :except => [:index, :show, :new]
  def liberarAcesso
    if @usuario.privilegio.id == 2 or @usuario.privilegio.id == 3
    return true
    else
      redirect_to "/static/grupo_diferente"
    return false
    end
  end
  
  
  # GET /lacres
  # GET /lacres.json
  def index
    @lacres = Lacre.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lacres }
    end
  end

  # GET /lacres/1
  # GET /lacres/1.json
  def show
    @lacre = Lacre.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lacre }
    end
  end

  # GET /lacres/new
  # GET /lacres/new.json
  def new
    @lacre = Lacre.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lacre }
    end
  end

  # GET /lacres/1/edit
  def edit
    @lacre = Lacre.find(params[:id])
  end

  # POST /lacres
  # POST /lacres.json
  def create
    @lacre = Lacre.new(params[:lacre])

    respond_to do |format|
      if @lacre.save
        format.html { redirect_to @lacre, notice: 'Lacre criado com sucesso.' }
        format.json { render json: @lacre, status: :created, location: @lacre }
      else
        format.html { render action: "new" }
        format.json { render json: @lacre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lacres/1
  # PUT /lacres/1.json
  def update
    @lacre = Lacre.find(params[:id])

    respond_to do |format|
      if @lacre.update_attributes(params[:lacre])
        format.html { redirect_to @lacre, notice: 'Lacre atualizado com sucesso.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @lacre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lacres/1
  # DELETE /lacres/1.json
  def destroy
    @lacre = Lacre.find(params[:id])
    @lacre.destroy

    respond_to do |format|
      format.html { redirect_to lacres_url }
      format.json { head :ok }
    end
  end
end
