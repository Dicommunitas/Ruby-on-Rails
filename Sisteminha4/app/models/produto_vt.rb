class ProdutoVt < ActiveRecord::Base
  
  validates :certificado, :uniqueness => { :case_sensitive => false }, :presence => true
  validates_presence_of :descricao_produto
      
  belongs_to :descricao_produto, :class_name => 'Produto'
  has_many :operacao_com_vagaos
  
  def nomeProduto
    descricao = descricao_produto.nome_curto
    descricao
  end

  def produtoECertificado
    pc = "#{descricao_produto.nome_curto} | (CE - #{certificado})"
    pc
  end
end
