# encoding: utf-8
class ComposicaoDeVagaosController < ApplicationController
  
  before_filter :liberarAcesso, :except => [:index, :show, :new]
  def liberarAcesso
    if @usuario.privilegio.id == 2
    return true
    else
      redirect_to "/static/grupo_diferente"
    return false
    end
  end
  
  
  # GET /composicao_de_vagaos
  # GET /composicao_de_vagaos.json
  def index
    @composicao_de_vagaos = ComposicaoDeVagao.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @composicao_de_vagaos }
    end
  end

  # GET /composicao_de_vagaos/1
  # GET /composicao_de_vagaos/1.json
  def show
    @composicao_de_vagao = ComposicaoDeVagao.find(params[:id])
    @composicao_de_vagao.conjunto_operacoes_de_vagoes = ConjuntoOperacoesDeVagoes.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @composicao_de_vagao }
    end
  end

  # GET /composicao_de_vagaos/new
  # GET /composicao_de_vagaos/new.json
  def new
    @composicao_de_vagao = ComposicaoDeVagao.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @composicao_de_vagao }
    end
  end

  # GET /composicao_de_vagaos/1/edit
  def edit
    @composicao_de_vagao = ComposicaoDeVagao.find(params[:id])
  end

  # POST /composicao_de_vagaos
  # POST /composicao_de_vagaos.json
  def create
    @composicao_de_vagao = ComposicaoDeVagao.new(params[:composicao_de_vagao])
    respond_to do |format|
      if @composicao_de_vagao.save
        
        Email.enviarRelatorioTemposComposicoesVagoes.deliver
        format.html { redirect_to @composicao_de_vagao, notice: 'Composição de vagão criada com sucesso.' }
        format.json { render json: @composicao_de_vagao, status: :created, location: @composicao_de_vagao }
      else
        format.html { render action: "new" }
        format.json { render json: @composicao_de_vagao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /composicao_de_vagaos/1
  # PUT /composicao_de_vagaos/1.json
  def update
    @composicao_de_vagao = ComposicaoDeVagao.find(params[:id])

    respond_to do |format|
      if @composicao_de_vagao.update_attributes(params[:composicao_de_vagao])
        if @composicao_de_vagao.final_descarga != nil
          @composicao_de_vagao.operacao_com_vagaos.each do |op|
            op.update_attributes(:operacao_finalizada => true)
            op.vt.update_attributes(:vt_carregado => false)
          end
        end
        format.html { redirect_to @composicao_de_vagao, notice: "Composição de vagão atualizada com sucesso." }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @composicao_de_vagao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /composicao_de_vagaos/1
  # DELETE /composicao_de_vagaos/1.json
  def destroy
    @composicao_de_vagao = ComposicaoDeVagao.find(params[:id])
    respond_to do |format|

      if @composicao_de_vagao.operacao_com_vagaos.empty?()

        @composicao_de_vagao.destroy
        format.html { redirect_to composicao_de_vagaos_url }
        format.json { head :ok }
      else

        format.html { redirect_to @composicao_de_vagao, alert: "ERRO: Não foi possível excluir a composição de vagões
          pois existem operacões com vagões que pertencem a ela." }
      end

    end
  end

  def atualizarVagaoCarregado
    erros = []
    operacao_com_vagao = OperacaoComVagao.find(:first, :conditions =>
    ["vt_id  = ? AND operacao_finalizada = ? ", params[:Vt][:vt_id], false] )

    @composicao_de_vagao = ComposicaoDeVagao.find(params[:composicao_de_vagao_id])
    if operacao_com_vagao != nil
      if operacao_com_vagao.composicao_de_vagao == nil
        if operacao_com_vagao.update_attribute(:composicao_de_vagao, @composicao_de_vagao)
          flash[:notice] = "Operação com vagão atualizada com sucesso."
        else
          erros << "ERRO: Operação com vagão #{operacao_com_vagao.vt.numero_curto}
        não pôde ser atualizada no banco de dados."
        end
      else
        erros << "ERRO: Operação com vagão #{operacao_com_vagao.vt.numero_curto} não pode ser salva.
         É provável que ele já pertença a uma composição."
      end

    end

    if params[:Vt][:vt_id] != "" and operacao_com_vagao == nil
      erros << "ERRO: Operação com vagão não pode ser salva. Verifique se este vagão já não está com todas as suas operações
                 finalizadas. É provável que ele não esteja carregado."
    end

    respond_to do |format|
      format.html { redirect_to @composicao_de_vagao, alert: erros }
    end
  end

  def atualizarVagoesCarregados
    erros = []
    @composicao_de_vagao = ComposicaoDeVagao.find(params[:composicao_de_vagao_id])
    flash[:operacoes_com_vagoes] = params[:operacoes_com_vagoes]
    objVt = Vt.new
    vts = objVt.validaStringVagoesPesos(params[:operacoes_com_vagoes], "")
    array_numero_curto_vagoes = vts[1]
    vts= vts[0]
    vts_db = Vt.all(:conditions => ["numero_curto  IN (?) AND vt_carregado IN (?)",
      array_numero_curto_vagoes, [true]*array_numero_curto_vagoes.length])

    id_vts = []
    vts_db.each do |vt|
      id_vts << vt.id
    end

    #operacao_com_vagoes_db = OoperacaoComVagao.all(:conditions => ["operacao_finalizada = (?)", false])
    operacao_com_vagoes_db = OperacaoComVagao.all(:conditions =>
    ["vt_id  IN (?) AND operacao_finalizada IN (?)", id_vts, [false]*id_vts.length])

    vts = objVt.procurarVagoesEmArray(vts, vts_db, "ERRO: Não existe uma operação com o vagão (", ") para ser descarregada.")

    vts.each do |vt|
      vt[:erro][1] = nil
      erros = erros + vt[:erro]
    end

    operacao_com_vagoes_db.each do |operacao_com_vagao|
      if operacao_com_vagao.composicao_de_vagao != nil
        erros << "ERRO: Operação com o vagão #{operacao_com_vagao.vt.numero_curto} já pertence a uma composição."
      end
    end

    erros  = erros - [nil]

    if erros == [] and params[:operacoes_com_vagoes] != ""
      @operacao_com_vagoes_db = [operacao_com_vagoes_db, @composicao_de_vagao]
      render "/grupo_op_vagoes/confirmar_grupo"
    else
      respond_to do |format|
        format.html { redirect_to @composicao_de_vagao, alert: erros }
      end
    end
  end
  
  def atualizacaoVagoesCarregadosAceita
    @composicao_de_vagao = ComposicaoDeVagao.find(params[:composicao_de_vagao_id])
    @operacao_com_vagaos = params[:operacao_com_vagaos]
    @operacao_com_vagaos.each do |id|
      OperacaoComVagao.find(id).update_attribute(:composicao_de_vagao, @composicao_de_vagao)
    end
    
    respond_to do |format|
      format.html { redirect_to @composicao_de_vagao, notice: 'Operações com vagões atualizadas com sucesso.' }
    end
  end
  
end
