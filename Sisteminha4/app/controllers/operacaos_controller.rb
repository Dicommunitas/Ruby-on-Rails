# encoding: utf-8
class OperacaosController < ApplicationController
  
  before_filter :liberarAcesso, :except => [:index, :show, :new]
  def liberarAcesso
    if @usuario.privilegio.id == 1
    return true
    else
      redirect_to "/static/grupo_diferente"
    return false
    end
  end
  
  
  # GET /operacaos
  # GET /operacaos.json
  def index
    @operacaos = Operacao.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @operacaos }
    end
  end

  # GET /operacaos/1
  # GET /operacaos/1.json
  def show
    @operacao = Operacao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @operacao }
    end
  end

  # GET /operacaos/new
  # GET /operacaos/new.json
  def new
    @operacao = Operacao.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @operacao }
    end
  end

  # GET /operacaos/1/edit
  def edit
    @operacao = Operacao.find(params[:id])
  end

  # POST /operacaos
  # POST /operacaos.json
  def create
    @operacao = Operacao.new(params[:operacao])

    respond_to do |format|
      if @operacao.save
        format.html { redirect_to @operacao, notice: 'Operação criada com sucesso.' }
        format.json { render json: @operacao, status: :created, location: @operacao }
      else
        format.html { render action: "new" }
        format.json { render json: @operacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /operacaos/1
  # PUT /operacaos/1.json
  def update
    @operacao = Operacao.find(params[:id])

    respond_to do |format|
      if @operacao.update_attributes(params[:operacao])
        format.html { redirect_to @operacao, notice: 'Operação atualizada com sucesso.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @operacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operacaos/1
  # DELETE /operacaos/1.json
  def destroy
    @operacao = Operacao.find(params[:id])

    respond_to do |format|
      if @operacao.amostras.empty?()
        @operacao.destroy
        format.html { redirect_to operacaos_url }
        format.json { head :ok }
      else
        format.html { redirect_to @operacao, alert: ['ERRO: Não foi possível excluir a operação pois existem amostras que utilizam ela.'] }
      end
    end
  end
end
