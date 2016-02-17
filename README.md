# RAILS TWITTER API

API rails para inserção de tweets no banco de dados.

### Versão Ruby

2.2.3

### Versão Rails

4.2.5.1

### Iniciando:

#### Requisitos:

#### 1 - Instalação do banco de dados postgres

Para mais informações de instalação do banco de dados, acesse: [postgres]

#### 2 - Criação do usuário e senha no banco de dados

#### 3 - Alteração do arquivo de configuração do banco de dados do app:

```sh
/workspace/rails_twitter_api/config/database.yml
```

altere o trecho do arquivo database.yml com o username e password configurados no passo 2: 

```sh
default: &default
  adapter: postgresql
  encoding: unicode
  pool: 5
  host: localhost
  username: seu_usuario_banco_de_dados	
  password: sua_senha_banco_de_dados
```

#### Instalação do Prax

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

Para verificar se o acesso a API está funcionado acesse a seguinte url no navegador:

http://api.rails_twitter_api.dev/

Se você visualizar a tela com a frase: "Welcome aboard", você já está com acesso a API.

[postgres]: <https://www.digitalocean.com/community/tutorials/how-to-use-postgresql-with-your-ruby-on-rails-application-on-ubuntu-14-04>

[README]: <https://github.com/ysbaddaden/prax/blob/master/README.rdoc>
