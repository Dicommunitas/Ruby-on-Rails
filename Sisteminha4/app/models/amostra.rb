# encoding: UTF-8
class Amostra < ActiveRecord::Base

  #validates :data                   ,:inclusion => { :in => 30000..50000 } ,validates_uniqueness_of :name, :case_sensitive => false, :presence =>  true, :in => 6..20, :with => /\A[a-zA-Z]+\z/, :length => { :within => 1..10000000 }, :length => { :maximum => 100 }  , :uniqueness =>  true, :uniqueness => { :case_sensitive => false }  , :numericality =>  true  , :inclusion  =>  { :in =>  0..9  } , :format =>  { :with =>  %r\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/,  :on =>  :create }
  validates :certificado_Ilab       , :uniqueness => { :case_sensitive => false }, :allow_blank => true
  validates :numero_gerado_Labware  , :uniqueness =>  true, :numericality =>  true, :allow_blank => true  #, :inclusion  =>  { :in =>  0..9  }
  validates_presence_of :responsavel, :operacao, :origem, :tipo_amostra, :produto
  
  validate :validarDataLimite
  
  
  belongs_to :responsavel, :class_name => 'Usuario'
  belongs_to :operacao
  belongs_to :origem
  belongs_to :tipo_amostra
  belongs_to :produto

  has_many :lacres, :dependent => :destroy

  @@imprimir_etiqueta = false
  def isImprimirEtiqueta
    @@imprimir_etiqueta
  end

  def imprimirEtiqueta
    @@imprimirEtiqueta = true
  end
  
  def amostraEncontrada
    r = ""
    if numero_gerado_Labware != nil
      r = "sim"
    elsif (created_at > (Date.today - 30)) and (numero_gerado_Labware == nil) 
      r = "não encontrada atual" 
    elsif (created_at < (Date.today - 30)) and (numero_gerado_Labware == nil) 
      r = "não encontrada antiga"
    end
    r
  end
  
  def pertenceAUmGrupo?(amostras)
    amostras = amostras.sort_by{|amostra| [amostra.id]}.reverse
    retorno = false
        
    if responsavel == amostras[0].responsavel and 
      operacao == amostras[0].operacao and 
      origem == amostras[0].origem and 
      tipo_amostra == amostras[0].tipo_amostra and 
      produto == amostras[0].produto and 
      75 > (amostras[0].created_at - created_at)
      retorno = true
    end
    
    retorno
  end

  private

  def validarDataLimite
    if self.created_at != nil
      if self.created_at < (Date.today - 30)
        errors.add :id, ": Amostra criada a mais de um mês não pode ser alterada."
      end
    end
  end

  public
  
end
