# ColdFusion / CFML Practice

ColdFusion / CFML のキャッチアップ用リポジトリです。

## 構成

- Lucee: CFML実行環境
- PostgreSQL: 練習用DB
- Docker Compose: ローカル環境構築

## 確認したこと

- `.cfm` ファイルの表示
- `form` によるPOST
- `cfif` による条件分岐
- `cfquery` によるDBアクセス
- PostgreSQLから取得した `Hello World` の画面表示

## 起動

```powershell
docker compose up
```

ブラウザで以下を開きます。

```text
http://localhost:8888/
```

Lucee管理画面は以下です。

```text
http://localhost:8888/lucee/admin/web.cfm
```

## DataSource設定

Lucee管理画面で以下のDataSourceを作成します。

```text
Name: practice
Type: PostgreSQL
Host: db
Port: 5432
Database: cfpractice
Username: cfuser
Password: cfpass
```
