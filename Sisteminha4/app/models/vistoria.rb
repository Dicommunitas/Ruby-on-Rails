# encoding: utf-8
class Vistoria < ActiveRecord::Base

  validates_presence_of :data, :vt
  validate :dataVistoriaValidates

  belongs_to :vt

  has_and_belongs_to_many :problemas
  
  def dataVistoriaValidates
    vistoria = Vt.find(self.vt).vistorias.last
    if self.data != nil and vistoria != nil and vistoria.data > self.data
      self.errors.add :data, "deve ser posterior ou igual a data da última vistoria deste vagão."
    end
    if vistoria != nil and vistoria.id != self.id and  self.id != nil
      self.errors.add :id, ": Você só pode alterar a última vistoria deste vagão."
    end
  end
end
