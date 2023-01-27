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


## Tips
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