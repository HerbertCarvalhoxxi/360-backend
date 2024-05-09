# Sync 360 BACKEND

## Introdução

Caro recrutador, obrigado pela oportunidade de estar nesse processo seletivo. Esse readme foi criado com o intuíto de instruir sobre como manipular o projeto criado, facilitando assim sua instalação.

Link do frontend: https://github.com/HerbertCarvalhoxxi/360-frontend

## 1 - Instalação

Após clonar o repositório, o comando de instalação é `npm install`

## 2 - Configurando o Prisma

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
O parâmetro `url` é responsável pela conexão com o banco de dados, crie uma variável local .env no diretório raiz do projeto (fora do src), lá deverá ser passada o local do banco de dados (dev.db), seu arquivo deve ser parecido com esse:

`DATABASE_URL="file:./dev.db"` 

Gere o cliente do Prisma com: `npx prisma generate`

Execute as migrações com `npx prisma migrate dev`

## 3 Verifique o CORS

Dentro de `src/server.ts` há a configuração do CORS, a url passada nele deverá ser a mesma que seu frontend está rodando

`app.use(cors({ origin: 'http://localhost:5173' }));` Modifique de acordo com a url do seu front!
