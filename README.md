# RAILS TWITTER API

API rails para inserção de tweets no banco de dados.

### Versão Ruby

2.2.3

### Versão Rails

4.2.5.1

### Iniciando:

#### Faça a clonagem ou download da aplicação para a máquina local em [Rails Twitter API].

#### 1 - Instalação do banco de dados postgres

Para mais informações de instalação do banco de dados, acesse: [Postgres]

#### 2 - Criação do usuário e senha no banco de dados

#### 3 - Instalação das gems da aplicação:

```sh
bundle install
```

#### 4 - Alteração do arquivo de configuração do banco de dados do app:

```sh
/workspace/rails_twitter_api/config/database.yml
```

Altere o trecho do arquivo database.yml com o username e password configurados no passo 2: 

```sh
default: &default
  adapter: postgresql
  encoding: unicode
  pool: 5
  host: localhost
  username: seu_usuario_banco_de_dados	
  password: sua_senha_banco_de_dados
```
No diretório do app rails /workspace/rails_twitter_api execute os comandos para a criação do banco de dados postgres:

```sh
rake db:create
rake db:migrate
```

#### 5 - Instalação do servidor proxy - Prax

Para somente usuários linux, as instruções foram seguidas através da documentação oficial, para mais informações leia o arquivo [README] no repositório do github. 

É recomendado que você clone o repositório dentro do diretório /opt e rode o instalador da seguinte maneira:

```sh
$ sudo git clone git://github.com/ysbaddaden/prax.git /opt/prax
```

```sh
$ cd /opt/prax/
$ ./bin/prax install
```
Faça o link da aplicação:

```sh
$ cd ~/workspace/rails_twitter_api
$ prax link
```
Para iniciar o servidor:

```sh
prax start
```

Verifique se o servidor Prax foi iniciado com sucesso acessando a seguinte url:

http://api.rails_twitter_api.dev/

Se você visualizar a tela com a frase: "Welcome aboard", o servidor proxy foi iniciado com sucesso.

#### 6 - Aplicativo ruby twitter_integration

Acesse a documentação [Twitter Integration] para executar o aplicativo e enviar os tweets para a API rails_twitter_api que serão armazenados no banco de dados.

#### Rake tasks

A API possue duas tasks para a busca de informações no banco de dados:

workspace/rails_twitter_api/lib/tasks/search_for.rake

##### Para buscar a média de tweets por horário execute no diretório do app:

```sh
rake search_for:average_tweets_per_hour
```

##### Para buscar o usuário com o maior número de tweets:

```sh
rake search_for:first_user_in_number_of_tweets
```

Os testes do MODEL tweet:
workspace/rails_twitter_api/spec/models

Os testes do controller tweets:
workspace/rails_twitter_api/spec/controllers/api/v1

Os testes para verificar a versão padrão da API:
workspace/rails_twitter_api/lib/spec


[Postgres]: <https://www.digitalocean.com/community/tutorials/how-to-use-postgresql-with-your-ruby-on-rails-application-on-ubuntu-14-04>

[README]: <https://github.com/ysbaddaden/prax/blob/master/README.rdoc>

[Twitter Integration]: <https://github.com/fchiapini/twitter_integration>

[Rails Twitter API]: <https://github.com/fchiapini/rails_twitter_api>
