# ColdFusion / CFML Practice

ColdFusion / CFML の練習用リポジトリです。

Lucee + PostgreSQL + Docker Compose を使い、ボタンを押すとDBから `Hello World` を取得して画面に表示します。

## 構成

- Lucee: CFML実行環境
- PostgreSQL: 練習用DB
- Docker Compose: ローカル開発環境

## 必要環境

- Docker Desktop
- Docker Compose
- Webブラウザ

Windowsの場合は、Docker Desktopを起動してからコマンドを実行してください。

## 起動手順

リポジトリのルートディレクトリで以下を実行します。

```powershell
docker compose up
```

バックグラウンドで起動したい場合は以下を実行します。

```powershell
docker compose up -d
```

起動後、ブラウザで以下を開きます。

```text
http://localhost:8888/
```

停止する場合は以下を実行します。

```powershell
docker compose down
```

## Lucee管理画面へのアクセス方法

LuceeのWeb管理画面は以下からアクセスできます。

```text
http://localhost:8888/lucee/admin/web.cfm
```

初回アクセス時に管理画面用のパスワード設定を求められる場合があります。

## DataSource設定内容

Lucee管理画面でDataSourceを作成します。

設定値は以下のとおりです。

```text
Name: practice
Type: PostgreSQL
Host: db
Port: 5432
Database: cfpractice
Username: cfuser
Password: cfpass
```

重要: PostgreSQLのHostは `localhost` ではなく `db` を指定します。Docker Compose内では、サービス名 `db` でPostgreSQLコンテナへ接続します。

## 動作確認手順

1. `docker compose up` でLuceeとPostgreSQLを起動します。
2. Lucee管理画面でDataSource `practice` を設定します。
3. ブラウザで `http://localhost:8888/` を開きます。
4. 画面のボタンを押します。
5. DBから取得した `Hello World` が表示されることを確認します。

初期データは `db/init.sql` で作成されます。

```sql
INSERT INTO messages (body) VALUES ('Hello World');
```

## ページ遷移の確認手順

1. ブラウザで `http://localhost:8888/` を開きます。
2. `メッセージ一覧へ` をクリックします。
3. `messages.cfm` に遷移することを確認します。
4. DBの `messages` テーブルの内容が一覧表示されることを確認します。
5. 一覧に `Hello World` が表示されることを確認します。

## 学習メモ

`<a href="messages.cfm">` は、ブラウザが別のURLへ移動する通常のページ遷移です。今回のように、`index.cfm` から `messages.cfm` へ画面を切り替えたい場合に使います。

`<cfinclude>` は、別ファイルの内容を現在のページ内に読み込むための仕組みです。ブラウザのURLは移動しないため、通常のリンククリックによるページ遷移とは違います。

## よくあるエラー

### Docker Desktop未起動

`docker compose up` 実行時にDockerへ接続できないエラーが出る場合は、Docker Desktopが起動しているか確認してください。

Docker Desktopを起動して、状態がRunningになってから再度実行します。

### DataSource未設定

ボタンを押したときにDataSource関連のエラーが出る場合は、Lucee管理画面でDataSource `practice` が設定されているか確認してください。

DataSource名はCFML側で参照している名前と一致している必要があります。

```cfml
<cfquery name="messageQuery" datasource="practice">
```

### PostgreSQLのHostをlocalhostにしてしまう

LuceeコンテナからPostgreSQLコンテナへ接続するため、Hostには `localhost` ではなく `db` を指定します。

`localhost` を指定すると、Luceeコンテナ自身を参照してしまい、PostgreSQLへ接続できません。

### DBボリューム初期化が必要なケース

`db/init.sql` はPostgreSQLのデータ領域が初めて作成されるときに実行されます。

すでに `db_data` ボリュームが存在する場合、`init.sql` を変更しても自動では再実行されません。初期データを作り直したい場合は、DBボリュームを削除してから起動し直します。

```powershell
docker compose down -v
docker compose up
```

注意: `docker compose down -v` はPostgreSQLの保存データを削除します。必要なデータがある場合は事前に退避してください。
