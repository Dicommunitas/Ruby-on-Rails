class Operacao < ActiveRecord::Base
  
  validates :descricao, :uniqueness => { :case_sensitive => false }, :presence => true
  
  has_many :amostras
end
