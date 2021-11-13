#encoding: utf-8
class FechamentoDiarioVagaosController < ApplicationController
  
  before_filter :liberarAcesso, :except => [:index, :show, :new]
  def liberarAcesso
    if @usuario.privilegio.id == 2
    return true
    else
      redirect_to "/static/grupo_diferente"
    return false
    end
  end
  
  
  # GET /fechamento_diario_vagaos
  # GET /fechamento_diario_vagaos.json
  def index
    @fechamento_diario_vagaos = FechamentoDiarioVagao.last(50)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fechamento_diario_vagaos }
    end
  end

  # GET /fechamento_diario_vagaos/1
  # GET /fechamento_diario_vagaos/1.json
  def show
    @fechamento_diario_vagao = FechamentoDiarioVagao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fechamento_diario_vagao }
    end
  end

  # GET /fechamento_diario_vagaos/new
  # GET /fechamento_diario_vagaos/new.json
  def new
    @fechamento_diario_vagao = FechamentoDiarioVagao.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fechamento_diario_vagao }
    end
  end

  # GET /fechamento_diario_vagaos/1/edit
  def edit
    @fechamento_diario_vagao = FechamentoDiarioVagao.find(params[:id])
  end

  # POST /fechamento_diario_vagaos
  # POST /fechamento_diario_vagaos.json
  def create
    @fechamento_diario_vagao = FechamentoDiarioVagao.new(params[:fechamento_diario_vagao])

    respond_to do |format|
      if @fechamento_diario_vagao.save
        format.html { redirect_to @fechamento_diario_vagao, notice: 'Fechamento diário de vagões criado com sucesso.' }
        format.json { render json: @fechamento_diario_vagao, status: :created, location: @fechamento_diario_vagao }
      else
        format.html { render action: "new" }
        format.json { render json: @fechamento_diario_vagao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fechamento_diario_vagaos/1
  # PUT /fechamento_diario_vagaos/1.json
  def update
    @fechamento_diario_vagao = FechamentoDiarioVagao.find(params[:id])

    respond_to do |format|
      if @fechamento_diario_vagao.update_attributes(params[:fechamento_diario_vagao])
        format.html { redirect_to @fechamento_diario_vagao, notice: 'Fechamento diário de vagões atualizado com sucesso.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @fechamento_diario_vagao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fechamento_diario_vagaos/1
  # DELETE /fechamento_diario_vagaos/1.json
  def destroy
    @fechamento_diario_vagao = FechamentoDiarioVagao.find(params[:id])
    respond_to do |format|
      if @fechamento_diario_vagao.composicao_de_vagaos.empty?()
        @fechamento_diario_vagao.destroy
        format.html { redirect_to fechamento_diario_vagaos_url }
        format.json { head :ok }
      else
        format.html { redirect_to @fechamento_diario_vagao, alert: ['ERRO: Não foi possível excluir o fechamento diário de vagões pois 
          existem composições de vagões que pertencem a ele.'] }
      end
    end
  end
end
