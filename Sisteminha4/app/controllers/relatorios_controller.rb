# encoding: utf-8
class RelatoriosController < ApplicationController

  before_filter :liberarAcesso, :except =>   [
    :gerar_etiquetas,
    :gerar_relatorio_tempos_composicoes_vagoes,
    :gerar_relatorio_fechamento_diario_vagoes,
    :index
    ]
  def liberarAcesso
    if @usuario.privilegio.id == 2 or @usuario.privilegio.id == 3
    return true
    else
      redirect_to "/static/grupo_diferente"
    return false
    end
  end

  def gerarRelatorioAmostras

    @amostras = []
    lista = []
    params.each do |p|
      lista = p
      if lista[1] == 'id'
        @amostras << Amostra.find(lista[0])
      end
    end
#render "relatorios/gerar_recibo_de_amostras"

    respond_to do |format|
      format.html {

        #html = render_to_string(:layout => 'relatorios')
        if params[:relatorio] == 'Gerar etiquetas'
          #html = render_to_string(:template => "relatorios/gerar_etiquetas")
          render "relatorios/gerar_etiquetas"
        elsif params[:relatorio] == 'Gerar recibo de amostras'
          #html = render_to_string(:template => "relatorios/gerar_recibo_de_amostras")
          render "relatorios/gerar_recibo_de_amostras"
        end

        #kit = PDFKit.new(html, :page_size => "A4")
        #send_data(kit.to_pdf, :filename => "etiquetas.pdf", :type => 'application/pdf')
        #return
      }
    end

  end

  def gerar_relatorio_tempos_composicoes_vagoes
    @composicao_de_vagaos = ComposicaoDeVagao.last(500).sort_by{|composicao_de_vagao| [composicao_de_vagao.entrada_plataforma]}.reverse

    respond_to do |format|
      format.html {
      #@composicao_de_vagaos
        html = render_to_string(:layout => 'relatorios')
        kit = PDFKit.new(html, :orientation => :landscape, :page_size => :A4)
        #kit.stylesheets << "#{Rails.root}/public/stylesheets/screen.css"
        send_data(kit.to_pdf, :filename => "relatorio tempos composicoes vagoes.pdf", :type => 'application/pdf')
        return # to avoid double render call
      }
    end

  end

  def gerar_relatorio_fechamento_diario_vagoes

    @fechamento_diario_vagao = FechamentoDiarioVagao.first

    respond_to do |format|
      format.html {
      #@fechamento_diario_vagaos
        html = render_to_string(:layout => 'relatorios')
        kit = PDFKit.new(html, :page_size => "A4")
        #kit.stylesheets << "#{Rails.root}/public/stylesheets/screen.css"
        send_data(kit.to_pdf, :filename => "relatorio fechamento diario vagoes.pdf", :type => 'application/pdf')
        return # to avoid double render call
      }
    end

  end

  def index
    render :layout => 'application', :template => 'relatorios/index'
  end

end
