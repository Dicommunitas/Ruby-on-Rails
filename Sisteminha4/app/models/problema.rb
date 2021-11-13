class Problema < ActiveRecord::Base

  validates :descricao, :uniqueness => { :case_sensitive => false }, :presence => true

  has_and_belongs_to_many :vistorias
   
end
