#encoding: utf-8
class NotaVtsController < ApplicationController

  before_filter :liberarAcesso, :except => [:index, :show, :new]
  def liberarAcesso
    if @usuario.privilegio.id == 2
    return true
    else
      redirect_to "/static/grupo_diferente"
    return false
    end
  end

  # GET /nota_vts
  # GET /nota_vts.json
  def index

    if params[:data_inicial] == nil
      @nota_vts = NotaVt.last(100)
    else
      begin
        data_i = DateTime.strptime(params[:data_inicial], '%d/%m/%Y')
        data_f = DateTime.strptime(params[:data_final], '%d/%m/%Y')
        params[:data_inicial] != nil and params[:data_final] != nil
        @nota_vts = NotaVt.where(
          "data >= :start_date AND data <= :end_date",
          {:start_date => data_i, :end_date => data_f })
      rescue
        @nota_vts = []
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @nota_vts }
    end
  end

  # GET /nota_vts/1
  # GET /nota_vts/1.json
  def show
    @nota_vt = NotaVt.find(params[:id])
    @nota_vt.conjunto_operacoes_de_vagoes = ConjuntoOperacoesDeVagoes.new
    @nota_vt.conjunto_operacoes_de_vagoes.nota_vt = @nota_vt

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @nota_vt }
    end
  end

  # GET /nota_vts/new
  # GET /nota_vts/new.json
  def new
    @nota_vt = NotaVt.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @nota_vt }
    end
  end

  # GET /nota_vts/1/edit
  def edit
    @nota_vt = NotaVt.find(params[:id])
  end

  # POST /nota_vts
  # POST /nota_vts.json
  def create
    @nota_vt = NotaVt.new(params[:nota_vt])

    respond_to do |format|
      if @nota_vt.save
        format.html { redirect_to @nota_vt, notice: 'Nota de vagões criada com sucesso.' }
        format.json { render json: @nota_vt, status: :created, location: @nota_vt }
      else
        format.html { render action: "new" }
        format.json { render json: @nota_vt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /nota_vts/1
  # PUT /nota_vts/1.json
  def update
    @nota_vt = NotaVt.find(params[:id])
    respond_to do |format|

      if @nota_vt.update_attributes(params[:nota_vt])
        format.html { redirect_to @nota_vt, notice: 'Nota de vagões atualizada com sucesso.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @nota_vt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nota_vts/1
  # DELETE /nota_vts/1.json
  def destroy
    @nota_vt = NotaVt.find(params[:id])
    respond_to do |format|
      if @nota_vt.operacao_com_vagaos.empty?()
        @nota_vt.destroy
        format.html { redirect_to nota_vts_url }
        format.json { head :ok }
      else
        format.html { redirect_to @nota_vt, alert: ['ERRO: Não foi possível excluir a nota
          de vagões pois existem operações com vagões que utilizam ela.'] }
      end
    end
  end

end
