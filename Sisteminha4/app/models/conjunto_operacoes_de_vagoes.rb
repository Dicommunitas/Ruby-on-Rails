#encoding: utf-8
class ConjuntoOperacoesDeVagoes
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :vagoes, :pesos, :produto, :produto_para_confirmar, :nota_vt, :vts, :op_vts, :composicao_de_vagao

  validates_presence_of :vagoes, :pesos, :produto

  validate :validarVagoesPesos

  validate :validarProdutoConfirmado

  validate :validarOpVagoes

  validate :validarOpVagoesAntesDeAtualizarOperacoes
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  def total
    total = 0
    pesos.split.each do |p|
      if true
      total = total + p.to_i
      end
    end
    total
  end
  
  def numeroDeOperacoes
    op_vts.length
  end
  
  def produtosDiferentes?
    diferentes = false
    produto = nil
    op_vts.each do |op|
      if produto == nil
        produto = op.produto_vt
      end
      if produto != op.produto_vt
        diferentes = true
      end
    end
    diferentes
  end

  private

  def validarVagoesPesos
    validarVagoes = true
    if vagoes.split.length != pesos.split.length and self.composicao_de_vagao == nil
      errors.add :vagoes, ": Os números dos vagões (#{vagoes.split.length}), não coincidem com os números dos pesos (#{pesos.split.length})."
    validarOperacoes = false
    end
    if validarVagoes
      self.vts = []
      vagoes.split.each do |vagao|
        vt = Vt.where("numero_curto = ?", "#{(vagao.delete "-")[0..3]}-#{(vagao.delete "-")[4..(vagao.length)]}").first
        if vt == nil
          errors.add :vagoes, ": Vagão (#{(vagao.delete "-")[0..3]}-#{(vagao.delete "-")[4..(vagao.length)]}) não existe."
        else
        self.vts << vt
        end
      end
    end
  end

  def validarOpVagoes
    cont = 0
    p = pesos.split
    self.op_vts = []
    if vts != nil
      if vts.length == p.length and composicao_de_vagao == nil
        vts.each do |vt|
          opVt = OperacaoComVagao.new(:peso => p[cont], :vt_id => vt.id, :nota_vt_id => nota_vt.id, :produto_vt_id => produto)
          cont = cont + 1
          if opVt.valid?
          self.op_vts << opVt
          else
            opVt.errors.full_messages.each do |msg|
              errors.add :vagoes, ": Vagão (#{vt.numero_curto}) - #{msg}"
            end
          end
        end
      end
    end
  end

  def validarProdutoConfirmado
    if produto != produto_para_confirmar
      errors.add :produto, ": Confira o produto da nota"
    end
  end

  def validarOpVagoesAntesDeAtualizarOperacoes
    if composicao_de_vagao != nil
      vts.each do |vt|
        opVt = vt.operacao_com_vagaos.last
        if opVt.composicao_de_vagao == nil
          opVt.composicao_de_vagao = composicao_de_vagao
        self.op_vts << opVt
        else
          errors.add :vagoes, ": Operação com vagão (#{vt.numero_curto}) já pertence a composição #{opVt.composicao_de_vagao.id}"
        end
        if vt.vt_carregado == false
          errors.add :vagoes, ": Vagão (#{vt.numero_curto}) está vazio"
        end
        if !opVt.valid?
          opVt.errors.full_messages.each do |msg|
            errors.add :vagoes, ": Vagão (#{vt.numero_curto}) - #{msg}"
          end
        end        
      end
    end
  end

  public

end
