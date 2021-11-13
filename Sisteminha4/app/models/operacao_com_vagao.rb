#encoding: utf-8
class OperacaoComVagao < ActiveRecord::Base

  validates :peso, :presence => true, :numericality =>  true, :inclusion => { :in => 30000..43100, :message => "fora dos limites (30.000 até 43.100)" }
  validates_presence_of :vt, :nota_vt, :produto_vt
  validate :validarVtVazioAoCriarNovo
  validate :validarPossibilidadeDeAlteracao
  validate :validarComposicaoVagao

  belongs_to :vt
  belongs_to :nota_vt
  belongs_to :produto_vt
  belongs_to :composicao_de_vagao
  def numeroVagao
    vt.numero_curto
  end

  private

  def validarVtVazioAoCriarNovo
    if self.vt != nil
      if self.vt.vt_carregado and self.id == nil
        errors.add :vt, "já está carregado"
      end
    end
  end

  def validarPossibilidadeDeAlteracao
    if id != nil
      if OperacaoComVagao.find(self.id).operacao_finalizada
        errors.add :operacao_finalizada, ": Operação já está finalizada"
      end
    end
  end

  def validarComposicaoVagao
    if composicao_de_vagao != nil
      if composicao_de_vagao.operacoesFinalizadas?
        errors.add :composicao_de_vagao, ": Composição de vagão já está finalizada"
      end
    end
  end

end
