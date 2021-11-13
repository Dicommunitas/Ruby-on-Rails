class Produto < ActiveRecord::Base
  
  validates :nome_completo, :uniqueness => { :case_sensitive => false }, :presence => true
  validates :nome_curto, :uniqueness => { :case_sensitive => false }, :presence => true
  validates :codigo, :uniqueness => { :case_sensitive => false }, :presence => true
      
  has_many :amostras
  has_many :produto_vts, :foreign_key => :descricao_produto_id
  
      
  def descricaoCompleta
    descricao = "#{self.codigo} | "
    descricao << "#{self.nome_curto} | "
    descricao << self.nome_completo
    descricao
  end
  
  def temBenzeno?
    if [1,2,3,34,35,36,41,42,43].include?(id)
      true
    else
      false
    end
  end
  
end
