# encoding: utf-8 

class OperacaoComVagaosController < ApplicationController
  
  before_filter :liberarAcesso, :except => [:index, :show, :new]
  before_filter :liberarExcluir, :only => [:destroy]
  
  def liberarAcesso
    if @usuario.privilegio.id == 2
    return true
    else
      redirect_to "/static/grupo_diferente"
    return false
    end
  end
  
  def liberarExcluir
    if @usuario.privilegio.id == 1
    return true
    else
      redirect_to "/static/grupo_diferente"
    return false
    end
  end
  
  # GET /operacao_com_vagaos
  # GET /operacao_com_vagaos.json
  def index
    
    if params[:data_inicial] == nil
      @operacao_com_vagaos = OperacaoComVagao.last(300) 
    else
      begin
        data_i = DateTime.strptime(params[:data_inicial], '%d/%m/%Y %H:%M')
        data_f = DateTime.strptime(params[:data_final], '%d/%m/%Y %H:%M')
        params[:data_inicial] != nil and params[:data_inicial] != nil
        @operacao_com_vagaos = OperacaoComVagao.where(
          "created_at >= :start_date AND created_at <= :end_date",
          {:start_date => data_i, :end_date => data_f })
      rescue
        @operacao_com_vagaos = []
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @operacao_com_vagaos }
    end
  end

  # GET /operacao_com_vagaos/1
  # GET /operacao_com_vagaos/1.json
  def show
    @operacao_com_vagao = OperacaoComVagao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @operacao_com_vagao }
    end
  end

  # GET /operacao_com_vagaos/new
  # GET /operacao_com_vagaos/new.json
  def new
    @operacao_com_vagao = OperacaoComVagao.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @operacao_com_vagao }
    end
  end

  # GET /operacao_com_vagaos/1/edit
  def edit
    @operacao_com_vagao = OperacaoComVagao.find(params[:id])
  end

  # POST /operacao_com_vagaos
  # POST /operacao_com_vagaos.json
  def create
    @operacao_com_vagao = OperacaoComVagao.new(params[:operacao_com_vagao])
    respond_to do |format|
      if @operacao_com_vagao.save
        @operacao_com_vagao.vt.update_attributes(:vt_carregado => true)
        format.html { redirect_to @operacao_com_vagao, notice: 'Operação com vagões criada com sucesso.' }
        format.json { render json: @operacao_com_vagao, status: :created, location: @operacao_com_vagao }
      else
        format.html { render action: "new" }
        format.json { render json: @operacao_com_vagao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /operacao_com_vagaos/1
  # PUT /operacao_com_vagaos/1.json
  def update
    @operacao_com_vagao = OperacaoComVagao.find(params[:id])

    respond_to do |format|
      if @operacao_com_vagao.update_attributes(params[:operacao_com_vagao])
        format.html { redirect_to @operacao_com_vagao, notice: 'Operação com vagões atualizada com sucesso.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @operacao_com_vagao.errors, status: :unprocessable_entity }
      end
    end
  end

  def limparComposicao
    @operacao_com_vagao = OperacaoComVagao.find(params[:operacao_com_vagao][:id])

    respond_to do |format|
      if @operacao_com_vagao.update_attributes(:composicao_de_vagao_id => nil)
        @operacao_com_vagao.vt.update_attributes(:vt_carregado => true)
        format.html { redirect_to @operacao_com_vagao, notice: 'Operação com vagão atualizada com sucesso.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @operacao_com_vagao.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /operacao_com_vagaos/1
  # DELETE /operacao_com_vagaos/1.json
  def destroy
    @operacao_com_vagao = OperacaoComVagao.find(params[:id])
    @operacao_com_vagao.vt.update_attributes(:vt_carregado => false)
    @operacao_com_vagao.destroy

    respond_to do |format|
      format.html { redirect_to operacao_com_vagaos_url }
      format.json { head :ok }
    end
  end
  
end