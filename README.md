# preciomedio.com.py

Aplicativo para termos o prédio medio de carros nas distintas regiões do Paraguay. 
Os filtros mais básicos podem ser:

fase 01:
- preço médio de um carro no país;
- preço médio de um carro em um estado;
- preço médio de um carro em uma cidade;
- filtrar por informe ou oferta de venda;
- separar base de dados por mês de referência;

fase 02:
- inserir motos no banco de dados

ideias futuras:
- Funcionalidade para o Agro:
    - Cadastro de Máquinas Agrícolas;
    - Cadastro de Implementos agrícolas;

# Monetização
- Pensar na possibilidade de intermediar a passagem do contato de quem oferta uma venda;
- Vender informações tais como: contato do ofertante, data da oferta, localização, valor;
- Aceitar ofertas de quem fez bom negócio com os dados da plataforma; doação voluntária;
- Tentar parcerias com lojas de usados para centralizar ofertas;

# Funcionalidades

fase 01:

- Tela Principal de Busca de Modelos/anos/valores
- Autenticação Simples;
- Cadastro de modelos de carro/moto;
- Cadastrar um valor de um carro;
- Sincronizar os dados na nuvem;
- Edição do usuário autenticado;

Obs: Os cadastros de municipio e departamento já estão disponíveis na plataforma;

ideias futuras
	- Mapa:
        - Mapa com a geolocalização dos inputs de preço;
	    - Exibição de dados nos markers como DateTime, Auto + Marca e valor;
	    - Mapa com os inputs de preços no site;
	

# 1.1. Home page

Página com motor de busca para exibição dos dados de preços de carros e e motos por país, estado ou cidade.

# 1.2. Autenticação o mais simples possível

A autenticação é necessária para realizar qualquer informação que possa alimentar a base de dados. 

# 1.3. Listagem de Municipio/Departamento

O usuário poderá listar um municipio em seu departamento para gerar estatística;

# 1.4. Cadastro de Carros

O usuário pode cadastrar um número ilimitado de veículos como contribuição voluntária de informes para gerar estatística.

# 1.5. Cadastrar o valor médio

Cadastrar um valor médio de um veículo com vínculo a uma municipio e departamento.

# 1.6. Dados Online e Offline com Persistência Local

O aplicativo poderá ter persistência local pelo menos de algumas informações offline via aplicativo.

# 1.7. Edição do usuário autenticado

O usuário poderá editar seu cadastro de usuário com a inserção de novos/dados atualizados.


# 2. Experiência do usuário

Toda a interface será construída utilizando componentes e recursos do material 3.
(vide mockup)

# 3. Arquitetura

# Objetivo

Este documento tem por objetivo principal organizar o processo de desenvolvimento de software.

# Regras iniciais, limites e análise

Pontos a serem levados em consideração antes de introduzir uma nova feature:

- Todo o projeto deverá respeitar as regras de Lint escritas no pacote flutterando -analyse;
- Este projeto deve ter cobertura mínima de testes de 70%;
- Camadas globais devem ter um lugar específico na aplicação, portanto, devem estar na pasta "core";
- Cada funcionalidade deverá ter sua própria pasta na qual devem ser depositados os arquivos para a execução dos casos de uso;
- Todos os design patterns usados no projeto devem estar listados na seção "Design Patterns" deste documento, caso contrário será considerado implementação errônea;
- Packages e plugins novos só poderão ser usados nos projetos após avaliações e aprovações de todos da equipe responsável pelo projeto;
- Atualização no Modelo de domínio somente poderão ser aceitas desde que estas atualizações sejam inseridas primeiro neste documento;
- Não é permitido ter uma classe concreta como dependência de uma camada. Somente será aceita coesão com classes abstratas ou interfaces;
- Cada camada deve ter apenas uma responsabilidade;


# Entidades

Criação das entidades e Valueobjects para atender as regras de negócio;

# Casos de Uso

Criação e edição de cadastros;

# Design Patterns
Repository Pattern: para acesso à API externa;
Service Pattern: para isolar trechos de código com outras responsabilidades;
Dependência Injection: Resolver dependências de classes;
Store: guardar e mudar estados;
Adapter: converter um objeto em outro;
Result: trabalhar com retorno múltiplo;

# Package Externos (comum)
uno: Cliente HTTP;
mocktail: testes de unidade;
dartz: retorno múltiplo no formato Failure e Sucess;

# Package externos (APP)

flutter_modular: Modularização de rotas e injeção de dependências;
hive: base de dados local;

