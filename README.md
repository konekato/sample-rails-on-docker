# APP


## Docker による Rails 環境構築
0. Dockerを起動しておく
   
Docker for Mac/Windows を起動。


1. リポジトリのクローン
```sh
git clone <repo>.git
```

2. コンテナのビルド
```sh
docker-compose build
```

3. データベースの作成
```sh
docker-compose run --rm web rails db:create
docker-compose run --rm web rails db:migrate
docker-compose run --rm web rails db:seed
```

4. コンテナの起動
```sh
docker-compose up　-d
```
この時、Rails サーバが立つので、 `rails s` をしなくていい。

5. localhost へアクセス
- http://localhost:3001/
- http://localhost:3001/samples


## Docker Tips
### コマンドを打つ方法
```sh
docker-compose exec <コンテナ名> <コマンド>
```
- `<コンテナ名>` は、今回は `web` と `db` 。
- `<コマンド>` は、 `web` であれば `rails s` や `db` であれば `mysql ...`など。

下記では、主に具体例を載せているので一緒に参照すると分かりやすいかもしれない。

### Rails コンテナと MySQL コンテナそれぞれに入る方法
```sh
docker-compose exec web bash
```

```sh
docker-compose exec db bash
```

こうすることで、コンテナ内でコマンド(`rails`, `bundle`等)を打つことができる。

### コンテナ内の MySQL データベースに入る方法

```sh
docker-compose exec db bash
...
bash-4.2$ mysql -h 127.0.0.1 -P 3306 -u root -p
Enter password:
```
or
```sh
docker-compose exec db mysql -h 127.0.0.1 -P 3306 -u root -p
Enter password:
```

---

# 備忘録
## 環境構築のためにやっていたこと
1. Docker で Rails の環境を構築。（以降、元ディレクトリ）
2. テストGitHubリポジトリにプッシュして、別のローカルディレクトリ（以降、先ディレクトリ）にてクローン
3. 先ディレクトリにて Docker をビルド。
4. **[失敗]** `rails new` しろと出る。（Rails プロジェクトがないことになっている）

原因は、おそらくだが `.gitignore` ファイルにて Docker 用のファイルを無視しすぎたこと。

[Dockerで環境構築すると勝手にできる.gitigonore](https://github.com/konekato/sample-rails-on-docker/blob/1cddb5dea26b5bace94f4cec0ca5a5e5cde5249b/.gitignore)でL.36-80のいずれかのファイルを無視したためだと考えられる。

[このように](./.gitignore)修正した結果、自分の環境ではいけた。

## 参照サイト
- Docker
  - メイン: [【Docker】Rails 7+MySQLのDocker環境を構築する](https://zenn.dev/wakkunn/articles/33c84147608078)
  - gitignore: [DockerでRailsの環境構築](https://qiita.com/fussy113/items/e9f7457ad4de74023ef6#step1-rails-new%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89%E3%81%BE%E3%81%A7%E3%81%AE%E6%BA%96%E5%82%99)