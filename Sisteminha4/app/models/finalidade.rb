class Finalidade < ActiveRecord::Base
  
  validates :descricao, :uniqueness => { :case_sensitive => false }, :presence => true
  
  has_many :lacres
end
