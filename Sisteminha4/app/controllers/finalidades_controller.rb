# encoding: UTF-8
class FinalidadesController < ApplicationController
  
  before_filter :liberarAcesso, :except => [:index, :show, :new]
  def liberarAcesso
    if @usuario.privilegio.id == 1
    return true
    else
      redirect_to "/static/grupo_diferente"
    return false
    end
  end
  
  
  # GET /finalidades
  # GET /finalidades.json
  def index
    @finalidades = Finalidade.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @finalidades }
    end
  end

  # GET /finalidades/1
  # GET /finalidades/1.json
  def show
    @finalidade = Finalidade.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @finalidade }
    end
  end

  # GET /finalidades/new
  # GET /finalidades/new.json
  def new
    @finalidade = Finalidade.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @finalidade }
    end
  end

  # GET /finalidades/1/edit
  def edit
    @finalidade = Finalidade.find(params[:id])
  end

  # POST /finalidades
  # POST /finalidades.json
  def create
    @finalidade = Finalidade.new(params[:finalidade])

    respond_to do |format|
      if @finalidade.save
        format.html { redirect_to @finalidade, notice: 'Finalidade criada com sucesso.' }
        format.json { render json: @finalidade, status: :created, location: @finalidade }
      else
        format.html { render action: "new" }
        format.json { render json: @finalidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /finalidades/1
  # PUT /finalidades/1.json
  def update
    @finalidade = Finalidade.find(params[:id])

    respond_to do |format|
      if @finalidade.update_attributes(params[:finalidade])
        format.html { redirect_to @finalidade, notice: 'Finalidade atualizada com sucesso.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @finalidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /finalidades/1
  # DELETE /finalidades/1.json
  def destroy
    @finalidade = Finalidade.find(params[:id])    
    respond_to do |format|
      if @finalidade.lacres.empty?()
        @finalidade.destroy
        format.html { redirect_to finalidades_url }
        format.json { head :ok }
      else
        format.html { redirect_to @finalidade, alert: ['ERRO: Não foi possível excluir a finalidade pois existem lacres que pertencem a ela.'] }
      end
    end
  end
  
end
