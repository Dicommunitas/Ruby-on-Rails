class Usuario < ActiveRecord::Base
  
  validates :chave, :uniqueness => { :case_sensitive => false }, :presence => true,
            :format => {:with => /^[A-Z0-9]{4,4}$/}
  validates :nome, :presence => true
  validates :nome_guerra, :presence => true
  validates_presence_of :privilegio      
      
  belongs_to :privilegio, :class_name => 'GrupoUsuario'
  
  has_many :amostras, :foreign_key => :responsavel_id
  has_many :composicao_de_vagaos, :foreign_key => :responsavel_id
  has_many :nota_vts, :foreign_key => :responsavel_id
  
end
