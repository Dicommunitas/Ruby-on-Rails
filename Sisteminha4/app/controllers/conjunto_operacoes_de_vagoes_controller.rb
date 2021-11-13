#encoding: utf-8
class ConjuntoOperacoesDeVagoesController < ApplicationController

  before_filter :liberarAcesso, :except => []
  def liberarAcesso
    if @usuario.privilegio.id == 2
    return true
    else
      redirect_to "/static/grupo_diferente"
    return false
    end
  end
  
  def confirmarProduto
    @conjunto_operacoes_de_vagoes = ConjuntoOperacoesDeVagoes.new(params[:conjunto_operacoes_de_vagoes])
    render "/conjunto_operacoes_de_vagoes/confirmar_produto"
  end
  
  def confirmarAtualizacaoOperacoes
    @conjunto_operacoes_de_vagoes = ConjuntoOperacoesDeVagoes.new(params[:conjunto_operacoes_de_vagoes])
    @composicao_de_vagao = ComposicaoDeVagao.find(@conjunto_operacoes_de_vagoes.composicao_de_vagao)
    @conjunto_operacoes_de_vagoes.composicao_de_vagao = @composicao_de_vagao
    @conjunto_operacoes_de_vagoes.pesos = "0"
    @conjunto_operacoes_de_vagoes.produto = "0"
    @conjunto_operacoes_de_vagoes.produto_para_confirmar = "0"
    
    if @conjunto_operacoes_de_vagoes.valid?
      @conjunto_operacoes_de_vagoes = @conjunto_operacoes_de_vagoes
      render "/conjunto_operacoes_de_vagoes/confirmar_atualizacao_operacoes"
    else
      @composicao_de_vagao.conjunto_operacoes_de_vagoes = @conjunto_operacoes_de_vagoes
      render "/composicao_de_vagaos/show"
    end
  end
  
  def atualizarOperacoes
    
    @conjunto_operacoes_de_vagoes = ConjuntoOperacoesDeVagoes.new(params[:conjunto_operacoes_de_vagoes])
    @composicao_de_vagao = ComposicaoDeVagao.find(@conjunto_operacoes_de_vagoes.composicao_de_vagao)
    @conjunto_operacoes_de_vagoes.op_vts.each do |op_vt|
      OperacaoComVagao.find(op_vt).update_attributes(:composicao_de_vagao_id => @composicao_de_vagao.id)
    end
    respond_to do |format|
      format.html { redirect_to @composicao_de_vagao, notice: 'Operações com vagões atualizadas com sucesso.' }
    end
    
  end
  
  # POST /conjunto_operacoes_de_vagoes
  # POST /conjunto_operacoes_de_vagoes.json
  def create
    flash[:notice] =  nil
    @conjunto_operacoes_de_vagoes = ConjuntoOperacoesDeVagoes.new(params[:conjunto_operacoes_de_vagoes])
    @nota_vt = NotaVt.find(@conjunto_operacoes_de_vagoes.nota_vt)
    @conjunto_operacoes_de_vagoes.nota_vt = @nota_vt
    if @conjunto_operacoes_de_vagoes.valid?
      @conjunto_operacoes_de_vagoes.op_vts.each do |op|
        op.save
        op.vt.update_attributes(:vt_carregado => true)
      end
      flash[:notice] =  'Operações com vagões criadas com sucesso.'
    end
    @nota_vt.conjunto_operacoes_de_vagoes = @conjunto_operacoes_de_vagoes
    render "/nota_vts/show"
  end

end
