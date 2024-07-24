# Sistema de Controle de Amostras e Operações de Vagões

## Descrição
Este projeto é um sistema web desenvolvido para auxiliar no controle de amostras e operações de vagões no Terminal Aquaviário da Transpetro em Paranaguá. O sistema visa facilitar o armazenamento de dados e agilizar o acesso à informação, melhorando a organização e a eficiência dos processos operacionais.

## Funcionalidades
* Controle Operacional de Vagões: Gerenciamento das atividades operacionais relacionadas aos vagões, incluindo registro de composições, operações e vistorias.
* Identificação de Amostras: Registro e acompanhamento das amostras coletadas, incluindo a emissão de etiquetas e a gestão dos parâmetros das amostras.
* Cadastro de Usuários: Gerenciamento dos usuários do sistema, com diferentes níveis de acesso e permissões.
* Emissão de Relatórios: Geração de relatórios para suporte à tomada de decisões.

## Tecnologias Utilizadas
* Framework: Ruby on Rails
* Banco de Dados: SQLite
* Sistema Operacional: Linux (Ubuntu)
* Ferramentas de Desenvolvimento: DIA Diagram

## Estrutura do Projeto (MVC - Model-View-Controlle)
* app/models: Contém as entidades do modelo de negócio.
* app/controllers: Contém os controladores responsáveis por gerenciar as interações do usuário com o sistema.
* app/views: Contém as views responsáveis pela apresentação dos dados ao usuário.

## Alguns Modelos da lógica da aplicação (Camada Model)
* Amostra: Representa uma amostra coletada no terminal.
* Composicao_de_vagao: Representa a composição de um vagão.
* Fechamento_diario_vagao: Registra o fechamento diário das operações com os vagões.
* Grupo_usuario: Define os diferentes grupos de usuários e suas permissões.
* Lacre: Gerencia os lacres utilizados nos vagões.
* Nota_vt: Registra as notas de vistoria dos vagões.
* Operacao_com_vagao: Gerencia as operações realizadas com os vagões.
* Usuario: Representa os usuários do sistema.
* Vistoria: Registra as vistorias realizadas nos vagões.

## 🚀 Começando

### Usando Gitpod
O Gitpod é um ambiente de desenvolvimento online que permite iniciar e trabalhar em projetos diretamente no navegador. Ele utiliza o arquivo .gitpod.yml para configurar e iniciar automaticamente o ambiente de desenvolvimento.

Para usar o Gitpod com este projeto:

Clique no botão abaixo para abrir o projeto no Gitpod:
**[Iniciar implantação com Gitpod](https://gitpod.io/new#https://github.com/Dicommunitas/Ruby-on-Rails)**

Ao abrir o projeto no Gitpod, ele irá:

Instalar as dependências do Ubuntu.
Instalar a versão especificada do Ruby.
Instalar o Bundler e as dependências do projeto.
Configurar e iniciar o servidor Rails.

### 🔧 Instalação Manual
Para instalar e rodar o projeto localmente, siga os passos descritos no aquivo *.gitpod.yml*

## Uso
Após a instalação, acesse http://localhost:8080 no navegador para utilizar o sistema.

### Login
Para usar o sistema, é necessário se logar como administrador. Use as seguintes credenciais:

* Usuário: ROOT#
* Senha: admin

Após o login, você poderá incluir novos usuários no sistema e atribuir privilégios a eles.

## 📄 Licença

Terminal de Paranaguá.
Copyright (C) 2012 Diego Lima da Costa

Este programa é software livre; você pode redistribuí-lo e/ou modificá-lo sob os termos da Licença Pública Geral GNU, conforme publicada pela Free Software Foundation; tanto a versão 2 da Licença como (a seu critério) qualquer versão mais atual.
Para ver uma versão traduzida, não oficial, desta licença clique em [licença](http://www.neoscopio.com/licenca_GPL_pt.txt) para detalhes.
