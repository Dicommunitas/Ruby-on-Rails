class VistoriasController < ApplicationController
  
  before_filter :liberarAcesso, :except => [:index, :show, :new]
  def liberarAcesso
    if @usuario.privilegio.id == 2
    return true
    else
      redirect_to "/static/grupo_diferente"
    return false
    end
  end
  
  
  # GET /vistorias
  # GET /vistorias.json
  def index
    @vistorias = Vistoria.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vistorias }
    end
  end

  # GET /vistorias/1
  # GET /vistorias/1.json
  def show
    @vistoria = Vistoria.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vistoria }
    end
  end

  # GET /vistorias/new
  # GET /vistorias/new.json
  def new
    @vistoria = Vistoria.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vistoria }
    end
  end

  # GET /vistorias/1/edit
  def edit
    @vistoria = Vistoria.find(params[:id])
  end

  # POST /vistorias
  # POST /vistorias.json
  def create
    @vistoria = Vistoria.new(params[:vistoria])

    respond_to do |format|
      if @vistoria.save
        format.html { redirect_to @vistoria, notice: 'Vistoria criada com sucesso.' }
        format.json { render json: @vistoria, status: :created, location: @vistoria }
      else
        format.html { render action: "new" }
        format.json { render json: @vistoria.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vistorias/1
  # PUT /vistorias/1.json
  def update
    @vistoria = Vistoria.find(params[:id])

    respond_to do |format|
      if @vistoria.update_attributes(params[:vistoria])
        format.html { redirect_to @vistoria, notice: 'Vistoria atualizada com sucesso.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @vistoria.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vistorias/1
  # DELETE /vistorias/1.json
  def destroy
    @vistoria = Vistoria.find(params[:id])
    @vistoria.destroy

    respond_to do |format|
      format.html { redirect_to vistorias_url }
      format.json { head :ok }
    end
  end
end
