# encoding: utf-8
class ProdutosController < ApplicationController
  
  before_filter :liberarAcesso, :except => [:index, :show, :new]
  def liberarAcesso
    if @usuario.privilegio.id == 1
    return true
    else
      redirect_to "/static/grupo_diferente"
    return false
    end
  end
  
  
  # GET /produtos
  # GET /produtos.json
  def index
    @produtos = Produto.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @produtos }
    end
  end

  # GET /produtos/1
  # GET /produtos/1.json
  def show
    @produto = Produto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @produto }
    end
  end

  # GET /produtos/new
  # GET /produtos/new.json
  def new
    @produto = Produto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @produto }
    end
  end

  # GET /produtos/1/edit
  def edit
    @produto = Produto.find(params[:id])
  end

  # POST /produtos
  # POST /produtos.json
  def create
    @produto = Produto.new(params[:produto])

    respond_to do |format|
      if @produto.save
        format.html { redirect_to @produto, notice: 'Produto criado com sucesso.' }
        format.json { render json: @produto, status: :created, location: @produto }
      else
        format.html { render action: "new" }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /produtos/1
  # PUT /produtos/1.json
  def update
    @produto = Produto.find(params[:id])

    respond_to do |format|
      if @produto.update_attributes(params[:produto])
        format.html { redirect_to @produto, notice: 'Produto atualizada com sucesso.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produtos/1
  # DELETE /produtos/1.json
  def destroy
    @produto = Produto.find(params[:id])
    respond_to do |format|
      erros = []
      if @produto.amostras.empty?() and
        @produto.produto_vts.empty?()

        @produto.destroy
        format.html { redirect_to produtos_url }
        format.json { head :ok }
      end
      if !@produto.amostras.empty?()
        erros << "ERRO: Não foi possível excluir o produto pois existem amostras que utilizam ele."
      end
      if !@produto.produto_vts.empty?()
        erros << "ERRO: Não foi possível excluir o produto pois existem produtos de vagões que utilizam ele."
      end
      if erros != []
         format.html { redirect_to @produto, alert: erros }
      end
    end
  end
end
