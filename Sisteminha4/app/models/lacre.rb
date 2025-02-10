class Lacre < ActiveRecord::Base
  
  validates_numericality_of :numero, :only_integer => true, :allow_blank => true, :greater_than => 0
  #validates :numero, :uniqueness => true, :allow_blank => true
  validates_presence_of :amostra, :finalidade
  
  belongs_to :amostra
  belongs_to :finalidade
end
