# encoding: utf-8
class ProdutoVtsController < ApplicationController
  
  before_filter :liberarAcesso, :except => [:index, :show, :new]
  def liberarAcesso
    if @usuario.privilegio.id == 2
    return true
    else
      redirect_to "/static/grupo_diferente"
    return false
    end
  end
  
  
  # GET /produto_vts
  # GET /produto_vts.json
  def index
    @produto_vts = ProdutoVt.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @produto_vts }
    end
  end

  # GET /produto_vts/1
  # GET /produto_vts/1.json
  def show
    @produto_vt = ProdutoVt.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @produto_vt }
    end
  end

  # GET /produto_vts/new
  # GET /produto_vts/new.json
  def new
    @produto_vt = ProdutoVt.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @produto_vt }
    end
  end

  # GET /produto_vts/1/edit
  def edit
    @produto_vt = ProdutoVt.find(params[:id])
  end

  # POST /produto_vts
  # POST /produto_vts.json
  def create
    @produto_vt = ProdutoVt.new(params[:produto_vt])

    respond_to do |format|
      if @produto_vt.save
        format.html { redirect_to @produto_vt, notice: 'Produto de vagões criado com sucesso.' }
        format.json { render json: @produto_vt, status: :created, location: @produto_vt }
      else
        format.html { render action: "new" }
        format.json { render json: @produto_vt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /produto_vts/1
  # PUT /produto_vts/1.json
  def update
    @produto_vt = ProdutoVt.find(params[:id])

    respond_to do |format|
      if @produto_vt.update_attributes(params[:produto_vt])
        format.html { redirect_to @produto_vt, notice: 'Produto de vagões atualizado com sucesso.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @produto_vt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produto_vts/1
  # DELETE /produto_vts/1.json
  def destroy
    @produto_vt = ProdutoVt.find(params[:id])
    respond_to do |format|
      if @produto_vt.operacao_com_vagaos.empty?()
        @produto_vt.destroy
        format.html { redirect_to produto_vts_url }
        format.json { head :ok }
      else
        format.html { redirect_to @produto_vt, alert: ['ERRO: Não foi possível excluir o produto de vagões
           pois existem operações com vagões que utilizam ele.']}
      end
    end
  end
end
