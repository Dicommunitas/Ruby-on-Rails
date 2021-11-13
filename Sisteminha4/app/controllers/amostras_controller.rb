class AmostrasController < ApplicationController

  before_filter :liberarAcesso, :except => [:index, :show, :new]
  before_filter :liberarExcluir, :only => [:destroy]
  
  def liberarAcesso
    if @usuario.privilegio.id == 2 or @usuario.privilegio.id == 3
    return true
    else
      redirect_to "/static/grupo_diferente"
    return false
    end
  end
  
  def liberarExcluir
    if @usuario.privilegio.id == 3
    return true
    else
      redirect_to "/static/grupo_diferente"
    return false
    end
  end

  # GET /amostras
  # GET /amostras.json
  def index
    if params[:data_inicial] == nil
      @amostras = Amostra.last(100) 
    else
      begin
        data_i = DateTime.strptime(params[:data_inicial], '%d/%m/%Y %H:%M')
        data_f = DateTime.strptime(params[:data_final], '%d/%m/%Y %H:%M')
        params[:data_inicial] != nil and params[:data_inicial] != nil
        @amostras = Amostra.where("created_at >= :start_date AND created_at <= :end_date",
          {:start_date => data_i, :end_date => data_f })
      rescue
        @amostras = []
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @amostras }
    end
  end

  # GET /amostras/1
  # GET /amostras/1.json
  def show
    @amostra = Amostra.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @amostra }
    end
  end

  # GET /amostras/new
  # GET /amostras/new.json
  def new
    @amostra = Amostra.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @amostra }
    end
  end

  # GET /amostras/1/edit
  def edit
    @amostra = Amostra.find(params[:id])
  end

  # POST /amostras
  # POST /amostras.json
  def create
    @amostra = Amostra.new(params[:amostra])
    respond_to do |format|
      if @amostra.save
        #lacre = Lacre.new(:finalidade_id => 1, :amostra_id => @amostra.id)
        #lacre.save
        format.html { redirect_to @amostra, notice: 'Amostra criada com sucesso.' }
        format.json { render json: @amostra, status: :created, location: @amostra }
      else
        format.html { render action: "new" }
        format.json { render json: @amostra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /amostras/1
  # PUT /amostras/1.json
  def update
    @amostra = Amostra.find(params[:id])
    respond_to do |format|
      if @amostra.update_attributes(params[:amostra])
        format.html { redirect_to @amostra, notice: 'Amostra atualizada com sucesso.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @amostra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /amostras/1
  # DELETE /amostras/1.json
  def destroy
    @amostra = Amostra.find(params[:id])
    if @amostra.valid?
      @amostra.destroy
  
      respond_to do |format|
        format.html { redirect_to amostras_url }
        format.json { head :ok }
      end
    else
      respond_to do |format|
        format.html { render action: "edit" }
        format.json { render json: @amostra.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /amostras
  # POST /amostras.json
  def duplicarAmostra
    amostra = Amostra.find(params[:id])
    @amostra = Amostra.new
    @amostra.data = amostra.data
    @amostra.operacao = amostra.operacao
    @amostra.origem = amostra.origem
    @amostra.tipo_amostra = amostra.tipo_amostra
    @amostra.produto = amostra.produto
    @amostra.observacao = amostra.observacao
    #@amostra.certificado_Ilab = amostra.certificado_Ilab
    #@amostra.numero_gerado_Labware = amostra.numero_gerado_Labware
    @amostra.responsavel = @usuario

    respond_to do |format|
      if @amostra.save
        format.html { redirect_to @amostra, notice: 'Amostra criada com sucesso.' }
        format.json { render json: @amostra, status: :created, location: @amostra }
      else
        format.html { render action: "new" }
        format.json { render json: @amostra.errors, status: :unprocessable_entity }
      end
    end
  end

end
