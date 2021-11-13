#encoding: utf-8
class AmostrasNavio
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :amostras, :data, :responsavel, :operacao, :produto, :nome_navio, :viagem, :berco, :tanques, :observacao, :finalidades, :lacres

  validates_presence_of :nome_navio, :viagem, :berco, :tanques, :finalidades
  validate :validarAmostra
  validate :validarLacres
  def initialize(attributes = {:tanques => [], :finalidades => []})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  def criarAmostraNavio
    amostra = Amostra.new(:data => data,
    :responsavel_id => responsavel,
    :operacao_id => operacao,
    :produto_id => produto,
    :origem_id => 44,
    :tipo_amostra_id => 1)
    amostra
  end

  def grupoAmostras

    amostras = []
    if tanques == []
      amostra =  criarAmostraNavio
      amostra.observacao = "Nome do navio / Vessel: #{nome_navio}. Viagem / Voyage: #{viagem}. Berço / Berth: #{berco}. Tanque / Tank: #{tanques}. Obs.: #{observacao}"
    amostras << amostra
    else
      tanques.each do |tq|
        amostra = criarAmostraNavio
        amostra.observacao = "Nome do navio / Vessel: #{nome_navio}. Viagem / Voyage: #{viagem}. Berço / Berth: #{berco}. Tanque / Tank: #{tq}. Obs.: #{observacao}"
        amostras << amostra
      end
    end

    amostras
  end

  def numeroEtiquetasComLacre
    if finalidades.include?("analise_terminal")
      etiquetas_com_lacre = tanques.length * (finalidades.length - 1)
    else
      etiquetas_com_lacre = tanques.length * finalidades.length
    end
    etiquetas_com_lacre
  end

  private

  def validarAmostra
    if self.tanques == nil
      self.tanques = []
    end
    if self.finalidades == nil
      self.finalidades = []
    end
    amostra = criarAmostraNavio
    if !amostra.valid?
      amostra.errors.full_messages.each do |msg|
        errors.add :amostras, ": #{msg}"
      end
    end
    if ![1,2,10].include?(operacao.to_i)
      errors.add :operacao, ": Operação inválida para este tipo de amostra"
    end

  end

  def validarLacres
    if lacres.split.length != 0
      
      lacres_array = lacres.split
      
      if lacres_array.length != numeroEtiquetasComLacre
        errors.add :lacres, ": Você está tentando incluir #{lacres_array.length} lacre(s), quando o número requerido é #{numeroEtiquetasComLacre}"
      end
      lacre_teste = Lacre.new(:amostra_id => Amostra.last.id, :finalidade_id => Finalidade.last.id)
      lacres_array.each do |l|
        lacre_teste.numero = l
        if !lacre_teste.valid?
          lacre_teste.errors.full_messages.each do |msg|
            errors.add :lacres, ": #{l} #{msg}"
          end
        end
      end
      
      if lacres_array.uniq.length != lacres_array.length
        errors.add :lacres, ": Você está tentando incluir lacres com números repetidos"
      end
    end
  end

  public

end
