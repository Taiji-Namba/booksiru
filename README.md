# ブクシル 解説
## 概要
### コンセプト
「え！？いつの間に新刊発売されてたの！？」を解消  
URL: https://booksiru.com/
<br>
<br>
<br>

### 開発背景
1. 周囲の知人・友人に「どんなサービスがあったら便利か」「日常生活で不便に感じていることはないか」とヒアリング<br>
2. 「気づいたら新刊が発売されていることがあるから事前に知りたい」との意見を聞く
3. 自分自身も読書が好きで同じ悩みを持っていたこともあり、それを解決できるアプリを作りたいとの想いで製作開始
<br>
<br>

### 使用イメージ
#### 書籍の検索ができます
![result](https://user-images.githubusercontent.com/67740063/103451195-3fc4c480-4d04-11eb-8974-e414eb26b3b3.gif)
<br>

#### お気に入り登録とお気に入り一覧の確認ができます
![result](https://user-images.githubusercontent.com/67740063/103451264-10fb1e00-4d05-11eb-8817-6f24363cbe04.gif)
<br>

#### 発売3日前に通知メールが届きます
<img width="489" alt="booksiru_email" src="https://user-images.githubusercontent.com/67740063/103450954-2ff7b100-4d01-11eb-9c2c-fa0f2615ae76.png">
<br>
<br>

## 工夫ポイント
- 楽天ブックス書籍APIと楽天ジャンル検索APIを用いて書籍の検索ができる
- 作品シリーズや作家のお気に入り登録ができる
- お気に入り一覧ページが見れる
- 発売日3日前に通知メール送信
- ER図を用いてデータベース設計
- AWS(VPC・EC2・RDS・IAM・Route53・ACM)にデプロイ
- HTTPS化
- チームでの開発を意識してプルリクベースで管理
<br>
<br>

## 課題と今後実装したいこと
- レスポンシブWebデザイン(スマホ対応)
- お気に入り登録/解除時にフラッシュ表示
- お気に入り登録/解除時の非同期処理
- LINEログイン
- LINEのMessaging APIを使用してLINEで通知
<br>
<br>

## DB設計
<img src = "https://user-images.githubusercontent.com/67740063/103469627-a7cde600-4daa-11eb-9292-b1c3909cd658.png" width = 50%>
<br>
<br>

## 開発環境
Ruby 2.6.6  
Rails 6.0.3.3  
PostgreSQL 13.1  
Bootstrap 4.5.2  
jQuery 3.5.1  

## Contact
南塲 大慈  
Twitter: https://twitter.com/taitan_progra  
Email: namba9499@gmail.com
