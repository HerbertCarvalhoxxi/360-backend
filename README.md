# Sync 360 BACKEND

## Introdução

Caro recrutador, obrigado pela oportunidade de estar nesse processo seletivo. Esse readme foi criado com o intuíto de instruir sobre como manipular o projeto criado, facilitando assim sua instalação.

## Instalação e execução do projeto

Após clonar o repositório, o comando de instalação é `npm install`
Para rodar a aplicação, use `npm run dev`, o servidor rodará normalmente na porta `3331`

## Configurando o Prisma

Verifique o arquivo `schema.prisma`, lá você encontrará a seguinte estrutura:

`
generator client {
  provider = "prisma-client-js"
}
datasource db {
  provider = "sqlite"
  url      = env("DATABASE_URL")
}
`
O parâmetro `url` é responsável pela conexão com o banco de dados, crie uma variável local .env no diretório raiz do projeto, lá deverá ser passada o local do banco de dados(dev.db), seu arquivo deve ser parecido com esse:

`DATABASE_URL="file:./dev.db"` 
