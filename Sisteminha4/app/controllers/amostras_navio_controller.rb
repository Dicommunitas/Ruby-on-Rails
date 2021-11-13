class AmostrasNavioController < ApplicationController

  before_filter :liberarAcesso, :except => [:new]
  def liberarAcesso
    if @usuario.privilegio.id == 2 or @usuario.privilegio.id == 3
    return true
    else
      redirect_to "/static/grupo_diferente"
    return false
    end
  end

  # GET /amostras/new
  # GET /amostras/new.json
  def new
    @amostras_navio = AmostrasNavio.new
  end

  # POST /amostras
  # POST /amostras.json
  def create
    @amostras_navio = AmostrasNavio.new(params[:amostras_navio])
    respond_to do |format|
      if @amostras_navio.valid?  
        lacres = @amostras_navio.lacres.split
        amostras = @amostras_navio.grupoAmostras
        
        amostras.each do |amostra|
          amostra.save
          if @amostras_navio.finalidades.include?("analise_terminal")
            lacre_an = Lacre.new(:amostra_id => amostra.id, :finalidade_id => 2)
            lacre_an.save
          end
          if @amostras_navio.finalidades.include?("arquivo_terminal")
            lacre_arq = Lacre.new(:amostra_id => amostra.id, :finalidade_id => 1)
            lacre_arq.numero = lacres.pop
            lacre_arq.save
          end
          if @amostras_navio.finalidades.include?("arquivo_navio")
            lacre_arqn = Lacre.new(:amostra_id => amostra.id, :finalidade_id => 3)
            lacre_arqn.numero = lacres.pop
            lacre_arqn.save
          end
          if @amostras_navio.finalidades.include?("repar")
            lacre_rep = Lacre.new(:amostra_id => amostra.id, :finalidade_id => 4)
            lacre_rep.numero = lacres.pop
            lacre_rep.save
          end
        end
        
        format.html { redirect_to "/amostras", notice: 'Amostras criadas com sucesso.' }
      else
        format.html { render action: "new" }
        format.json { render json: @amostras_navio.errors, status: :unprocessable_entity }
      end
    end
  end

end
