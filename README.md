# ClassChat

## back 
###### web_framework
rails 5.2.3
###### DB  
mysql 5.7 
## front 
###### framework
nuxt.js
###### UIFramework
Element
###### Formatter
ESLint

## setup
コンテナのビルド
```
docker-compose build
```
データベース作成
```
docker-compose run --rm back rails db:create
```
コンテナ立ち上げ
```
docker-compose up
```
localhost:3000にrails  
localhost:8080にnuxtが表示されれば成功

#####　コンテナの停止
```
docker-compose down
```
