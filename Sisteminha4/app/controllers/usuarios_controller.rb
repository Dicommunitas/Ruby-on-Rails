# encoding: UTF-8
class UsuariosController < ApplicationController

  before_filter :liberarAcesso, :except => [:index, :show, :edit, :update, :new]
  def liberarAcesso
    if @usuario.privilegio.id == 1
    return true
    else
      redirect_to "/static/grupo_diferente"
    return false
    end
  end

  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @usuarios }
    end
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
    @usuario = Usuario.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @usuario }
    end
  end

  # GET /usuarios/new
  # GET /usuarios/new.json
  def new
    @usuario = Usuario.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @usuario }
    end
  end

  # GET /usuarios/1/edit
  def edit
    @usuario = Usuario.find(params[:id])
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(params[:usuario])
    @usuario.chave.upcase!
    @usuario.senha = Digest::SHA2.hexdigest("linux #{@usuario.senha} sudo su").force_encoding('UTF-8')

    respond_to do |format|
      if @usuario.save
        format.html { redirect_to @usuario, notice: 'Usuário criado com sucesso.' }
        format.json { render json: @usuario, status: :created, location: @usuario }
      else
        format.html { render action: "new" }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /usuarios/1
  # PUT /usuarios/1.json
  def update
    @usuario_logado = @usuario
    @usuario = Usuario.find(params[:id])
    respond_to do |format|
      params[:usuario][:chave].upcase!
      if  @usuario_logado.id == @usuario.id

        if @usuario.update_attribute(:senha, Digest::SHA2.hexdigest("linux #{params[:usuario][:senha]} sudo su").force_encoding('UTF-8'))

          format.html { redirect_to @usuario, notice: 'Usuário atualizado com sucesso.' }
          format.json { head :ok }

        else

          format.html { render action: "edit" }
          format.json { render json: @usuario.errors, status: :unprocessable_entity }

        end

      elsif @usuario_logado.privilegio.id == 1
        if @usuario.id != 1

          if @usuario.update_attributes(params[:usuario]) and
          @usuario.update_attribute(:senha, Digest::SHA2.hexdigest("linux #{@usuario.senha} sudo su").force_encoding('UTF-8'))

            format.html { redirect_to @usuario, notice: 'Usuário atualizado com sucesso.' }
            format.json { head :ok }

          else
            format.html { render action: "edit" }
            format.json { render json: @usuario.errors, status: :unprocessable_entity }
          end
        end

      else
        format.html { render action: "edit" }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario = Usuario.find(params[:id])
    respond_to do |format|
      erros = []
      if !@usuario.amostras.empty?()
        erros << "ERRO: Não foi possível excluir o usuário pois existem amostras que pertencem a ele."
      end
      if !@usuario.composicao_de_vagaos.empty?()
        erros << "ERRO: Não foi possível excluir o usuário pois existem composições de vagões que pertencem a ele."
      end
      if !@usuario.nota_vts.empty?()
        erros << "ERRO: Não foi possível excluir o usuário pois existem notas de vagões que pertencem a ele."
      end
      if @usuario.id == 1
        erros << "OPA! Isso não é legal. Você não pode excluir o Super Usuário."
      end
      if erros == []
        if @usuario.destroy
          format.html { redirect_to usuarios_url }
          format.json { head :ok }
        end
      else
        format.html { redirect_to @usuario, alert: erros }
      end
    end
  end
end
