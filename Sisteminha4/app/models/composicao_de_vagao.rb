# encoding: utf-8
class ComposicaoDeVagao < ActiveRecord::Base

  validates_presence_of :responsavel, :fechamento_diario_vagao
  validates :temperatura, :numericality =>  true, :inclusion => { :in => 10..90, :message => "fora dos limites" }, :allow_blank => true
  validates :tanque_destino, :format => {:with => /^[0-9]{3,3}$/}, :allow_blank => true
  validate :validarDatas
  validate :validarPossibilidadeDeAlteracao
  validate :validarOperacaoComVagaos

  belongs_to :responsavel, :class_name => "Usuario"
  belongs_to :fechamento_diario_vagao

  has_many :solicitacaos, :dependent => :destroy
  has_many :operacao_com_vagaos

  attr_accessor :conjunto_operacoes_de_vagoes

  private
  def validarOperacaoComVagaos
    if operacao_com_vagaos != nil
      operacao_com_vagaos.each do |op|
        if !op.valid?
          op.errors.full_messages.each do |msg|
            errors.add :id, ": #{msg}"
          end
        end
      end
    end
  end

  def validarPossibilidadeDeAlteracao
    if operacoesFinalizadas?
      errors.add :id, ": Operação já está finalizada"
    end
  end

  def validarDatas
    if (self.inicio_descarga != nil and
    self.entrada_plataforma != nil and
    self.entrada_plataforma > self.inicio_descarga) or
    (self.inicio_descarga != nil and
    self.entrada_plataforma == nil)

      self.errors.add :inicio_descarga, ": Início da descarga deve ser após entrada na plataforma"
    end
    if (self.final_descarga != nil and
    self.inicio_descarga != nil and
    self.inicio_descarga > self.final_descarga) or
    (self.final_descarga != nil and
    self.inicio_descarga == nil)

      self.errors.add :final_descarga, ": Final da descarga deve ser após início da descarga"
    end
    if (self.saida_plataforma != nil and
    self.final_descarga != nil and
    self.final_descarga > self.saida_plataforma) or
    (self.saida_plataforma != nil and
    self.final_descarga == nil)

      self.errors.add :saida_plataforma, ": Saída da plataforma deve ser após final da descarga"
    end
    if self.id != nil and self.final_descarga == nil
      if ComposicaoDeVagao.find(self.id).final_descarga != nil
        self.errors.add :final_descarga, ": Final da descarga não pode ser nula"
      end
    end
  end

  public

  def idEntradaPlataformaInicioDescarga

    s = "#{self.id} | Entrada: "
    if self.entrada_plataforma != nil
      s << self.entrada_plataforma.strftime("%d/%m/%Y %H:%M")
    end
    s << " | Início: "
    if self.inicio_descarga != nil
      s << self.inicio_descarga.strftime("%d/%m/%Y %H:%M")
    end
    s

  end

  def totalPeso
    peso = 0
    operacao_com_vagaos.each do |ov|
      peso = peso + ov.peso
    end
    peso
  end

  def qtdOperacoes
    operacao_com_vagaos.length
  end

  def produto
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

  def tempoParaInicio
    tempo =  inicio_descarga - entrada_plataforma
    tempo
  end

  def tempoParaLiberar
    tempo =  final_descarga - inicio_descarga
    tempo
  end

  def datasDasNotas
    datas = []
    operacao_com_vagaos.each do |op|
      if !datas.include?(op.nota_vt.data)
      datas << op.nota_vt.data
      end
    end
    datas
  end

  def tempoTranspetro
    tempo = tempoParaInicio + tempoParaLiberar
    tempo
  end

  def tempoAll
    comp_anterior = ComposicaoDeVagao.last(:conditions => ["final_descarga < ?", final_descarga])
    if comp_anterior != nil
      tempo = entrada_plataforma - comp_anterior.final_descarga
    else
    tempo = 0
    end
    tempo
  end

  def consistente?
    consistente = true
    if entrada_plataforma == nil or
    inicio_descarga == nil or
    final_descarga == nil or
    saida_plataforma == nil or
    temperatura == nil or
    tanque_destino == nil or
    operacao_com_vagaos == []

    consistente = false

    end
    consistente
  end

  def operacoesFinalizadas?
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
