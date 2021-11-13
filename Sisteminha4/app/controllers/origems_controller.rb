# encoding: utf-8
class OrigemsController < ApplicationController
  
  before_filter :liberarAcesso, :except => [:index, :show, :new]
  def liberarAcesso
    if @usuario.privilegio.id == 1
    return true
    else
      redirect_to "/static/grupo_diferente"
    return false
    end
  end
  
  
  # GET /origems
  # GET /origems.json
  def index
    @origems = Origem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @origems }
    end
  end

  # GET /origems/1
  # GET /origems/1.json
  def show
    @origem = Origem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @origem }
    end
  end

  # GET /origems/new
  # GET /origems/new.json
  def new
    @origem = Origem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @origem }
    end
  end

  # GET /origems/1/edit
  def edit
    @origem = Origem.find(params[:id])
  end

  # POST /origems
  # POST /origems.json
  def create
    @origem = Origem.new(params[:origem])

    respond_to do |format|
      if @origem.save
        format.html { redirect_to @origem, notice: 'Origem criada com sucesso.' }
        format.json { render json: @origem, status: :created, location: @origem }
      else
        format.html { render action: "new" }
        format.json { render json: @origem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /origems/1
  # PUT /origems/1.json
  def update
    @origem = Origem.find(params[:id])

    respond_to do |format|
      if @origem.update_attributes(params[:origem])
        format.html { redirect_to @origem, notice: 'Origem atualizada com sucesso.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @origem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /origems/1
  # DELETE /origems/1.json
  def destroy
    @origem = Origem.find(params[:id])
    
    respond_to do |format|
      if @origem.amostras.empty?()
        @origem.destroy
        format.html { redirect_to origems_url }
        format.json { head :ok }
      else
        format.html { redirect_to @origem, alert: ['ERRO: Não foi possível excluir a origem pois existem amostras que utilizam ela.'] }
      end
    end
  end
end
