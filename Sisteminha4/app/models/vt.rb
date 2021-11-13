#encoding: utf-8
class Vt < ActiveRecord::Base

  validates :numero_curto, :uniqueness => { :case_sensitive => false }, :presence => true,
            :format => {:with => /^([0-9]{4,4})-([0-9]{1,1})$/}
  validates :identificacao_completa, :uniqueness => { :case_sensitive => false }, :presence => true,
            :format => {:with => /^TSC-([0-9]{6,6})-([0-9]{1,1})$/}

  has_many :vistorias
  has_many :operacao_com_vagaos

  def ultimaVistoria
    self.vistorias.last
  end
  
  private

  def validaFormatoVagao(string_vt)

    case string_vt
    when /^([0-9]{4,4})-([0-9]{1,1})$/; true
    else; false
    end

  end

  def validaFormatoPeso(string_peso)

    case string_peso
    when /^[0-9]{5,5}$/; true
    else; false
    end

  end
  public
  
  def vtsPorProblema(problema)
    vts = []
              #vagoes = Vt.all
              #Category.all :joins => {:posts => [{:comments => :guest}, :tags]}
              #SELECT categories.* FROM categories INNER JOIN posts ON posts.category_id = categories.id
              #Client.all(:joins => 'LEFT OUTER JOIN addresses ON addresses.client_id = clients.id')
              #EntidadeA.joins(:entidadeB => :entidadeC).where("entidadeC.name = ?", nome)  
              #todos vts com ultima vistoria com problema id
              #Student.joins(:schools).where(:schools => { :category => 'public' })
              #vagoes = Vt.joins(:vistorias).where(:vistorias => {:problema => '1'})
              #all :joins => {:vts => {:vistorias => :problemas}}
              
    vagoes = Vt.all
    
    vagoes.each do |vt|
      #if vt.vistorias.sort_by{|vistoria| :data}.last.problemas.include?(problema)
      if vt.vistorias.last != nil and vt.vistorias.last.problemas.include?(problema)
        vts << vt
      end
    end
    vts
  end

end
