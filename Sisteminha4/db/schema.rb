# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120529202501) do

  create_table "amostras", :force => true do |t|
    t.datetime "data"
    t.string   "certificado_Ilab"
    t.integer  "numero_gerado_Labware"
    t.text     "observacao"
    t.integer  "responsavel_id",        :null => false
    t.integer  "operacao_id",           :null => false
    t.integer  "origem_id",             :null => false
    t.integer  "tipo_amostra_id",       :null => false
    t.integer  "produto_id",            :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "amostras", ["operacao_id"], :name => "index_amostras_on_operacao_id"
  add_index "amostras", ["origem_id"], :name => "index_amostras_on_origem_id"
  add_index "amostras", ["produto_id"], :name => "index_amostras_on_produto_id"
  add_index "amostras", ["responsavel_id"], :name => "index_amostras_on_responsavel_id"
  add_index "amostras", ["tipo_amostra_id"], :name => "index_amostras_on_tipo_amostra_id"

  create_table "composicao_de_vagaos", :force => true do |t|
    t.datetime "entrada_plataforma"
    t.datetime "inicio_descarga"
    t.datetime "final_descarga"
    t.datetime "saida_plataforma"
    t.integer  "temperatura"
    t.string   "tanque_destino"
    t.boolean  "utilizou_vapor"
    t.text     "observacao"
    t.integer  "responsavel_id",             :null => false
    t.integer  "fechamento_diario_vagao_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "composicao_de_vagaos", ["fechamento_diario_vagao_id"], :name => "index_composicao_de_vagaos_on_fechamento_diario_vagao_id"
  add_index "composicao_de_vagaos", ["responsavel_id"], :name => "index_composicao_de_vagaos_on_responsavel_id"

  create_table "fechamento_diario_vagaos", :force => true do |t|
    t.datetime "data",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "finalidades", :force => true do |t|
    t.string   "descricao",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grupo_usuarios", :force => true do |t|
    t.string   "tipo",       :null => false
    t.string   "descricao",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lacres", :force => true do |t|
    t.integer  "numero"
    t.integer  "amostra_id",    :null => false
    t.integer  "finalidade_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lacres", ["amostra_id"], :name => "index_lacres_on_amostra_id"
  add_index "lacres", ["finalidade_id"], :name => "index_lacres_on_finalidade_id"

  create_table "nota_vts", :force => true do |t|
    t.integer  "numero_v2",      :null => false
    t.date     "data",           :null => false
    t.integer  "responsavel_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nota_vts", ["responsavel_id"], :name => "index_nota_vts_on_responsavel_id"

  create_table "operacao_com_vagaos", :force => true do |t|
    t.integer  "peso",                                      :null => false
    t.boolean  "operacao_finalizada",    :default => false, :null => false
    t.integer  "vt_id",                                     :null => false
    t.integer  "nota_vt_id",                                :null => false
    t.integer  "produto_vt_id",                             :null => false
    t.integer  "composicao_de_vagao_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "operacao_com_vagaos", ["composicao_de_vagao_id"], :name => "index_operacao_com_vagaos_on_composicao_de_vagao_id"
  add_index "operacao_com_vagaos", ["nota_vt_id"], :name => "index_operacao_com_vagaos_on_nota_vt_id"
  add_index "operacao_com_vagaos", ["produto_vt_id"], :name => "index_operacao_com_vagaos_on_produto_vt_id"
  add_index "operacao_com_vagaos", ["vt_id"], :name => "index_operacao_com_vagaos_on_vt_id"

  create_table "operacaos", :force => true do |t|
    t.string   "descricao",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "origems", :force => true do |t|
    t.string   "descricao",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "problemas", :force => true do |t|
    t.string   "descricao",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "problemas_vistorias", :id => false, :force => true do |t|
    t.integer  "problema_id"
    t.integer  "vistoria_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "produto_vts", :force => true do |t|
    t.string   "certificado",          :null => false
    t.integer  "descricao_produto_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "produto_vts", ["descricao_produto_id"], :name => "index_produto_vts_on_descricao_produto_id"

  create_table "produtos", :force => true do |t|
    t.string   "nome_curto",    :null => false
    t.string   "codigo",        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nome_completo"
  end

  create_table "solicitacaos", :force => true do |t|
    t.datetime "data_hora",                       :null => false
    t.string   "responsavel_atender_solicitacao", :null => false
    t.integer  "composicao_de_vagao_id",          :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "descricao"
  end

  add_index "solicitacaos", ["composicao_de_vagao_id"], :name => "index_solicitacaos_on_composicao_de_vagao_id"

  create_table "tipo_amostras", :force => true do |t|
    t.string   "descricao",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "chave",         :null => false
    t.string   "nome",          :null => false
    t.string   "nome_guerra",   :null => false
    t.string   "observacao"
    t.string   "senha",         :null => false
    t.integer  "privilegio_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usuarios", ["privilegio_id"], :name => "index_usuarios_on_privilegio_id"

  create_table "vistorias", :force => true do |t|
    t.date     "data",       :null => false
    t.integer  "vt_id",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vistorias", ["vt_id"], :name => "index_vistorias_on_vt_id"

  create_table "vts", :force => true do |t|
    t.string   "numero_curto",                              :null => false
    t.string   "identificacao_completa",                    :null => false
    t.boolean  "vt_carregado",           :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
