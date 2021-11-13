#encoding: utf-8
class FechamentoDiarioVagao < ActiveRecord::Base
  
  validates :data, :uniqueness =>  true, :presence => true
  validate :validarSeUltimaParaAlterar
  validate :validarPossibilidadeDeAlteracao
  
  has_many :composicao_de_vagaos
  
  def pesoTotal
    p = 0
    composicao_de_vagaos.each do |cv|
      p = p + cv.totalPeso
    end
    p
  end
  
  def qtdOperacoes
    qtd = 0
    composicao_de_vagaos.each do |comp|
      qtd = qtd + comp.operacao_com_vagaos.length
    end
    qtd
  end
  
  def produto
    produtos = []
    string = ''
    composicao_de_vagaos.each do |comp|
      if !produtos.include?(comp.produto)
        produtos << comp.produto
        string = "#{string} #{comp.produto}"
      end
    end
    string
  end
  
  def composicoesFinalizado?
    composicoes_finalizadas = true
    if composicao_de_vagaos == []
      composicoes_finalizadas = false
    end
    composicao_de_vagaos.each do |comp|
      if !comp.operacoesFinalizadas?
      composicoes_finalizadas = false
      break
      end
    end
    composicoes_finalizadas
  end
  
  private 
  
  def validarSeUltimaParaAlterar
    if id != nil
      valido = false
      fechamentos = FechamentoDiarioVagao.last(2)
      fechamentos.each do |f|
        if f.id == id
          valido = true
        end
      end
      if !valido
        errors.add :id, ": Só é permitido alterar os dois últimos fechamentos de vagões."
      end
    end
  end
  
  def validarPossibilidadeDeAlteracao
    if composicoesFinalizado?
      errors.add :id, ": Operação já está finalizada"
    end
  end
  
  public
end
