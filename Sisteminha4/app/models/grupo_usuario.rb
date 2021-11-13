class GrupoUsuario < ActiveRecord::Base
  
  validates :tipo, :uniqueness => { :case_sensitive => false }, :presence => true
  validates :descricao, :uniqueness => { :case_sensitive => false }, :presence => true
  
  has_many :usuarios, :foreign_key => :privilegio_id #, :dependent => :destroy
end
