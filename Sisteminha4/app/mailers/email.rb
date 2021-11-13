#encoding: utf-8
class Email < ActionMailer::Base
  add_template_helper(ApplicationHelper)


  default :from => "tepar-sutur@petrobras.com.br"
  
  def enviarRelatorioTemposComposicoesVagoes
    @composicao_de_vagaos = ComposicaoDeVagao.last(50).sort_by{|composicao_de_vagao| [composicao_de_vagao.entrada_plataforma]}.reverse
    #@composicao_de_vagaos = ComposicaoDeVagao.last(50).reverse
    destino = ""
    destino = "#{destino}, <d.lima@petrobras.com.br>"
    destino = "#{destino}, <dicommunitas@gmail.com>"
    mail(:to => destino, 
         :subject => "Sistema Tepar: Relatório dos Tempos das Composicões dos Vagões")
         
         
         
=begin         
    @composicao_de_vagaos = ComposicaoDeVagao.last(50).sort_by{|composicao_de_vagao| [composicao_de_vagao.entrada_plataforma]}.reverse
    #@composicao_de_vagaos = ComposicaoDeVagao.last(50).reverse
    destino = ""
    destino = "#{destino}, <almirss@petrobras.com.br>" 
    destino = "#{destino}, <laerciohaisi@petrobras.com.br>" 
    destino = "#{destino}, <amarildo@petrobras.com.br>" 
    destino = "#{destino}, <brunovicente@petrobras.com.br>" 
    destino = "#{destino}, <braganholo@petrobras.com.br>" 
    destino = "#{destino}, <carlosrm@petrobras.com.br>"
    destino = "#{destino}, <forigo@petrobras.com.br>"
    destino = "#{destino}, <marceloap@petrobras.com.br>" 
    destino = "#{destino}, <nauber@petrobras.com.br>"
    destino = "#{destino}, <pampuch@petrobras.com.br>" 
    destino = "#{destino}, <altair.souza@all-logistica.com>" 
    destino = "#{destino}, <cleitondd@all-logistica.com>"
    destino = "#{destino}, <ecosta@all-logistica.com>" 
    destino = "#{destino}, <est.araucaria.carga@all-logistica.com>" 
    destino = "#{destino}, <fabioad@all-logistica.com>" 
    destino = "#{destino}, <felipesa@all-logistica.com>" 
    destino = "#{destino}, <henrique.novais@all-logistica.com>"
    destino = "#{destino}, <raphael.nascimento@all-logistica.com>"
    destino = "#{destino}, <rodrigods@all-logistica.com>" 
    destino = "#{destino}, <supervisores.upo@all-logistica.com>" 
    destino = "#{destino}, <willian.silva@all-logistica.com>" 
    destino = "#{destino}, <rafael.morassi@all-logistica.com>" 
    destino = "#{destino}, <rubens.neto@all-logistica.com>" 
    destino = "#{destino}, <thiago.piccolotto@all-logistica.com>"
    mail(:to => destino, 
         :subject => "Sistema Tepar: Relatório dos Tempos das Composicões dos Vagões")
    
=end



  end
end
