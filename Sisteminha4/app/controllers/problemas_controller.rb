# encoding: UTF-8
class ProblemasController < ApplicationController
  
  before_filter :liberarAcesso, :except => [:index, :show, :new]
  def liberarAcesso
    if @usuario.privilegio.id == 1
    return true
    else
      redirect_to "/static/grupo_diferente"
    return false
    end
  end
  
  
  # GET /problemas
  # GET /problemas.json
  def index
    @problemas = Problema.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @problemas }
    end
  end

  # GET /problemas/1
  # GET /problemas/1.json
  def show
    @problema = Problema.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @problema }
    end
  end

  # GET /problemas/new
  # GET /problemas/new.json
  def new
    @problema = Problema.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @problema }
    end
  end

  # GET /problemas/1/edit
  def edit
    @problema = Problema.find(params[:id])
  end

  # POST /problemas
  # POST /problemas.json
  def create
    @problema = Problema.new(params[:problema])

    respond_to do |format|
      if @problema.save
        format.html { redirect_to @problema, notice: 'Problema criado com sucesso.' }
        format.json { render json: @problema, status: :created, location: @problema }
      else
        format.html { render action: "new" }
        format.json { render json: @problema.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /problemas/1
  # PUT /problemas/1.json
  def update
    @problema = Problema.find(params[:id])

    respond_to do |format|
      if @problema.update_attributes(params[:problema])
        format.html { redirect_to @problema, notice: 'Problema atualizado com sucesso.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @problema.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /problemas/1
  # DELETE /problemas/1.json
  def destroy
    @problema = Problema.find(params[:id])
    respond_to do |format|
      if @problema.vistorias.empty?()
        @problema.destroy
        format.html { redirect_to problemas_url }
        format.json { head :ok }
      else
        format.html { redirect_to @problema, alert: ['ERRO: Não foi possível excluir o problema 
          pois existem vistorias que utilizam ele.'] }
      end
    end
  end
end
