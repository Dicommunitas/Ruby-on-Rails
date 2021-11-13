#encoding: utf-8

class SolicitacaosController < ApplicationController
  
  before_filter :liberarAcesso, :except => [:index, :show, :new]
  def liberarAcesso
    if @usuario.privilegio.id == 2
    return true
    else
      redirect_to "/static/grupo_diferente"
    return false
    end
  end
  
  
  # GET /solicitacaos
  # GET /solicitacaos.json
  def index
    @solicitacaos = Solicitacao.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @solicitacaos }
    end
  end

  # GET /solicitacaos/1
  # GET /solicitacaos/1.json
  def show
    @solicitacao = Solicitacao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @solicitacao }
    end
  end

  # GET /solicitacaos/new
  # GET /solicitacaos/new.json
  def new
    @solicitacao = Solicitacao.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @solicitacao }
    end
  end

  # GET /solicitacaos/1/edit
  def edit
    @solicitacao = Solicitacao.find(params[:id])
  end

  # POST /solicitacaos
  # POST /solicitacaos.json
  def create
    @solicitacao = Solicitacao.new(params[:solicitacao])

    respond_to do |format|
      if @solicitacao.save
        format.html { redirect_to @solicitacao, notice: 'Solicitação criada com sucesso.' }
        format.json { render json: @solicitacao, status: :created, location: @solicitacao }
      else
        format.html { render action: "new" }
        format.json { render json: @solicitacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /solicitacaos/1
  # PUT /solicitacaos/1.json
  def update
    @solicitacao = Solicitacao.find(params[:id])

    respond_to do |format|
      if @solicitacao.update_attributes(params[:solicitacao])
        format.html { redirect_to @solicitacao, notice: 'Solicitação atualizada com sucesso.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @solicitacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solicitacaos/1
  # DELETE /solicitacaos/1.json
  def destroy
    @solicitacao = Solicitacao.find(params[:id])
    @solicitacao.destroy

    respond_to do |format|
      format.html { redirect_to solicitacaos_url }
      format.json { head :ok }
    end
  end
end
