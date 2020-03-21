#db作成
ridgepoleを使っているためmigrationは行わない
1, モデル作成、skip-migrationを忘れない
```
docker-compose run back rails g model {model_name} --skip-migration
```
1、Schemfileにdbを定義
2、下記のコマンド実行でDb作成
```
docker-compose run back rake db:ridgepole
```
3、annotateを実行し、モデルファイルにDb詳細を追加
```
docker-compose run back bundle exec annotate
```

2と3を同時
```
docker-compose run back rake db:with_annotate
```

