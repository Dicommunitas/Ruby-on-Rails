class Solicitacao < ActiveRecord::Base
  
  validates :data_hora, :uniqueness => true, :presence => true
  validates :responsavel_atender_solicitacao, :presence => true
  validates_presence_of :composicao_de_vagao, :descricao
      
  belongs_to :composicao_de_vagao
end
