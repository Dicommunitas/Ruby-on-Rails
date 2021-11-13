Sisteminha2::Application.routes.draw do


  root :to => 'static#index'
  
  
  get 'static/:id' => 'static#static', :as => :static
  #match 'static/:action', :controller => 'static'
  
  
  match '/nota_vt/incluir_operacoes_com_vagoes', :controller => 'nota_vts', :action => :incluirOperacoesComVagoes
  
  match '/composicao_de_vagao/atualizar_vagao_carregado', :controller => 'composicao_de_vagaos', :action => :atualizarVagaoCarregado
  
  match '/composicao_de_vagao/atualizar_vagoes_carregados', :controller => 'composicao_de_vagaos', :action => :atualizarVagoesCarregados
  
  match '/composicao_de_vagao/aceitar_atualizacao_vagoes_carregados', :controller => 'composicao_de_vagaos', :action => :atualizacaoVagoesCarregadosAceita
  
  #match 'amostras/duplicar_amostra', :controller => :amostras, :action => :duplicarAmostra
  
  match 'relatorios/gerar_relatorio_de_amostras', :controller => :relatorios, :action => :gerarRelatorioAmostras
  
  match 'relatorios/gerar_relatorio_tempos_composicoes_vagoes', :controller => :relatorios, :action => :gerar_relatorio_tempos_composicoes_vagoes
  
  match 'relatorios/gerar_relatorio_fechamento_diario_vagoes', :controller => :relatorios, :action => :gerar_relatorio_fechamento_diario_vagoes
  
  match 'relatorios', :controller => :relatorios, :action => :index
  
  match 'menu_vt', :controller => :vts, :action => :menu_vt
  
  match 'amostras_navio/new', :controller => :amostras_navio, :action => :new
  
  match 'amostras_navio/create', :controller => :amostras_navio, :action => :create
  
  match 'buscar_amostras', :controller => :amostras, :action => :index
  
  match 'buscar_operacoes_com_vagoes', :controller => :operacao_com_vagaos, :action => :index
  
  match '/buscar_notas_de_vts', :controller => :nota_vts, :action => :index
  
  match '/conjunto_operacoes_de_vagoes/create', :controller => :conjunto_operacoes_de_vagoes, :action => :create
  
  match '/conjunto_operacoes_de_vagoes/confirmar_produto', :controller => :conjunto_operacoes_de_vagoes, :action => :confirmarProduto
  
  match '/conjunto_operacoes_de_vagoes/atualizar_operacoes', :controller => :conjunto_operacoes_de_vagoes, :action => :atualizarOperacoes
  
  match '/conjunto_operacoes_de_vagoes/confirmar_atualizacao_operacoes', :controller => :conjunto_operacoes_de_vagoes, :action => :confirmarAtualizacaoOperacoes

  match '/operacao_com_vagao/limpar_composicao', :controller => :operacao_com_vagaos, :action => :limparComposicao
  
  resources :fechamento_diario_vagaos

  resources :composicao_de_vagaos

  resources :lacres

  resources :solicitacaos

  resources :vts

  resources :vistorias

  resources :usuarios

  resources :tipo_amostras

  resources :produto_vts

  resources :produtos

  resources :problemas

  resources :origems

  resources :operacao_com_vagaos

  resources :operacaos

  resources :nota_vts

  resources :grupo_usuarios

  resources :finalidades

  resources :amostras
  
  get ":id" => "static#static", :as => :static


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
