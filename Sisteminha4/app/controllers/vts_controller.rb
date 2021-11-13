# encoding: UTF-8
class VtsController < ApplicationController
  
  before_filter :liberarAcesso, :except => [:index, :show, :menu_vt, :new]
  def liberarAcesso
    if @usuario.privilegio.id == 1
    return true
    else
      redirect_to "/static/grupo_diferente"
    return false
    end
  end
  
  def menu_vt
    render :layout => 'application', :template => 'vts/menu_vt' 
  end
  
  # GET /vts
  # GET /vts.json
  def index
    @vts = Vt.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vts }
    end
  end

  # GET /vts/1
  # GET /vts/1.json
  def show
    @vt = Vt.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vt }
    end
  end

  # GET /vts/new
  # GET /vts/new.json
  def new
    @vt = Vt.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vt }
    end
  end

  # GET /vts/1/edit
  def edit
    @vt = Vt.find(params[:id])
  end

  # POST /vts
  # POST /vts.json
  def create
    @vt = Vt.new(params[:vt])

    respond_to do |format|
      if @vt.save
        format.html { redirect_to @vt, notice: 'Vagão criado com sucesso.' }
        format.json { render json: @vt, status: :created, location: @vt }
      else
        format.html { render action: "new" }
        format.json { render json: @vt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vts/1
  # PUT /vts/1.json
  def update
    @vt = Vt.find(params[:id])

    respond_to do |format|
      if @vt.update_attributes(params[:vt])
        format.html { redirect_to @vt, notice: 'Vagão atualizado com sucesso.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @vt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vts/1
  # DELETE /vts/1.json
  def destroy
    @vt = Vt.find(params[:id])
    respond_to do |format|
      erros = []
      
      if @vt.vistorias.empty?() and
      @vt.operacao_com_vagaos.empty?()

        @vt.destroy
        format.html { redirect_to vts_url }
        format.json { head :ok }
      end
      
      if !@vt.vistorias.empty?()
        erros << 'ERRO: Não foi possível excluir o vagão tanque
           pois existem vistorias que pertencem a ele.'
      end
      
      if !@vt.operacao_com_vagaos.empty?()
        erros << 'ERRO: Não foi possível excluir o vagão tanque
           pois existem operações com vagões que utilizam ele.'
      end
      
      if erros != []
        format.html { redirect_to @vt, alert: erros }
      end
      
    end
  end
end
