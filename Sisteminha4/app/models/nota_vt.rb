# encoding: UTF-8
class NotaVt < ActiveRecord::Base

  validates_numericality_of :numero_v2, :only_integer => true
  validates :numero_v2, :uniqueness => true, :presence => true,
            :inclusion => { :in => 2000..50000, :message => "é o número da V2 (V2 Nº) e não o número do controle do formulário" }
  validates :data, :presence => true
  validates :responsavel, :presence => true

  belongs_to :responsavel, :class_name => 'Usuario'

  has_many :operacao_com_vagaos
  
  attr_accessor :conjunto_operacoes_de_vagoes
  
  def produtos
    produtos = []
    string = ''
    operacao_com_vagaos.each do |op|
      if !produtos.include?(op.produto_vt.descricao_produto.nome_curto)
        produtos << op.produto_vt.descricao_produto.nome_curto
        string = "#{string} |#{op.produto_vt.descricao_produto.nome_curto}|"
      end
    end
    string
  end

  def qtdOperacoes
    operacao_com_vagaos.length
  end

  def pesoTotal
    peso = 0
    operacao_com_vagaos.each do |ov|
      peso = peso + ov.peso
    end
    peso
  end

  def operacoesFinalizadas
    operacoes_finalizadas = true
    if operacao_com_vagaos == []
      operacoes_finalizadas = false
    end
    operacao_com_vagaos.each do |op|
      if !op.operacao_finalizada
      operacoes_finalizadas = false
      break
      end
    end
    operacoes_finalizadas
  end

end
