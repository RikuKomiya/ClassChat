#db作成
ridgepoleを使っているためmigrationは行わない
1, モデル作成、skip-migrationを忘れない
```
rails g model {model_name} --skip-migration
```
1、Schemfileにdbを定義
2、下記のコマンド実行でDb作成
```
bundle exec ridgepole -c config/database.yml -E development --apply -f Schemafile
```
3、annotateを実行し、モデルファイルにDb詳細を追加
```
bundle exec annotate
```
