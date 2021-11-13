# encoding: utf-8
class TipoAmostrasController < ApplicationController
  
  before_filter :liberarAcesso, :except => [:index, :show, :new]
  def liberarAcesso
    if @usuario.privilegio.id == 1
    return true
    else
      redirect_to "/static/grupo_diferente"
    return false
    end
  end
  
  
  # GET /tipo_amostras
  # GET /tipo_amostras.json
  def index
    @tipo_amostras = TipoAmostra.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tipo_amostras }
    end
  end

  # GET /tipo_amostras/1
  # GET /tipo_amostras/1.json
  def show
    @tipo_amostra = TipoAmostra.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tipo_amostra }
    end
  end

  # GET /tipo_amostras/new
  # GET /tipo_amostras/new.json
  def new
    @tipo_amostra = TipoAmostra.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tipo_amostra }
    end
  end

  # GET /tipo_amostras/1/edit
  def edit
    @tipo_amostra = TipoAmostra.find(params[:id])
  end

  # POST /tipo_amostras
  # POST /tipo_amostras.json
  def create
    @tipo_amostra = TipoAmostra.new(params[:tipo_amostra])

    respond_to do |format|
      if @tipo_amostra.save
        format.html { redirect_to @tipo_amostra, notice: 'Tipo de amostra criada com sucesso.' }
        format.json { render json: @tipo_amostra, status: :created, location: @tipo_amostra }
      else
        format.html { render action: "new" }
        format.json { render json: @tipo_amostra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_amostras/1
  # PUT /tipo_amostras/1.json
  def update
    @tipo_amostra = TipoAmostra.find(params[:id])

    respond_to do |format|
      if @tipo_amostra.update_attributes(params[:tipo_amostra])
        format.html { redirect_to @tipo_amostra, notice: 'Tipo de amostra atualizada com sucesso.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @tipo_amostra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_amostras/1
  # DELETE /tipo_amostras/1.json
  def destroy
    @tipo_amostra = TipoAmostra.find(params[:id])
    respond_to do |format|
      if @tipo_amostra.amostras.empty?()
        @tipo_amostra.destroy
        format.html { redirect_to tipo_amostras_url }
        format.json { head :ok }
      else
        format.html { redirect_to @tipo_amostra, alert: ['ERRO: Não foi possível excluir o tipo de amostra pois existem amostras que utilizam ele.'] }
      end
    end
  end
end
