#encoding: utf-8
class GrupoUsuariosController < ApplicationController
  
  before_filter :liberarAcesso, :except => []
  def liberarAcesso
    if @usuario.id == 1
    return true
    else
      redirect_to "/404"
    return false
    end
  end
  
  
  # GET /grupo_usuarios
  # GET /grupo_usuarios.json
  def index
    @grupo_usuarios = GrupoUsuario.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @grupo_usuarios }
    end
  end

  # GET /grupo_usuarios/1
  # GET /grupo_usuarios/1.json
  def show
    @grupo_usuario = GrupoUsuario.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @grupo_usuario }
    end
  end

  # GET /grupo_usuarios/new
  # GET /grupo_usuarios/new.json
  def new
    @grupo_usuario = GrupoUsuario.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @grupo_usuario }
    end
  end

  # GET /grupo_usuarios/1/edit
  def edit
    @grupo_usuario = GrupoUsuario.find(params[:id])
  end

  # POST /grupo_usuarios
  # POST /grupo_usuarios.json
  def create
    @grupo_usuario = GrupoUsuario.new(params[:grupo_usuario])

    respond_to do |format|
      if @grupo_usuario.save
        format.html { redirect_to @grupo_usuario, notice: 'Grupo de usuários criado com sucesso.' }
        format.json { render json: @grupo_usuario, status: :created, location: @grupo_usuario }
      else
        format.html { render action: "new" }
        format.json { render json: @grupo_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /grupo_usuarios/1
  # PUT /grupo_usuarios/1.json
  def update
    @grupo_usuario = GrupoUsuario.find(params[:id])

    respond_to do |format|
      if @grupo_usuario.update_attributes(params[:grupo_usuario])
        format.html { redirect_to @grupo_usuario, notice: 'Grupo de usuários atualizado com sucesso.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @grupo_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grupo_usuarios/1
  # DELETE /grupo_usuarios/1.json
  def destroy
    @grupo_usuario = GrupoUsuario.find(params[:id])
    respond_to do |format|
      if @grupo_usuario.usuarios.empty?()
        @grupo_usuario.destroy
        format.html { redirect_to grupo_usuarios_url }
        format.json { head :ok }
      else
        format.html { redirect_to @grupo_usuario, alert: ['ERRO: Não foi possível excluir o grupo de usuários pois existem usuários que pertencem a ele.'] }
      end
    end
  end
end
