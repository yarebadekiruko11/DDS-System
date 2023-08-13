# DSS管理システム
<!--ここにアプリ名を入力-->

​
## サイト概要
### サイトテーマ
<!--何を『目的』とし、どのような『分類』なのかを簡潔に書く-->
#### DrivingSchoolStudent管理システム
自動車学校に通う生徒の情報について、指導員同士での情報共有を図るシステム。
また、管理者側からは生徒数の把握や、日付毎の新規生徒登録数をカレンダーで見ることができる。

### テーマを選んだ理由
<!--なぜこのようなテーマにしたかを説明する-->
現在、私の所属する学校内の生徒管理システムは、学校と生徒の連携が主なシステムとなっています。
例えば自分の端末で授業の予約を取ったり、オンラインで授業を見たりなどです。
ただ、生徒の情報を指導員が把握するには大きな手間がかかります。

現在一人の生徒に対し、アドバイザーとして担当指導員が一人つきます。
担当は全ての授業を行うわけでなく、進行状況を確認したり、スケジュール調整の相談に応じるといったことが主になります。
<br>その情報を確認するためには、紙面で保管されている全ての生徒のファイルの中から目的の生徒のファイルを探し出す必要があります。
（PCのデータにはいつ受講しているか、何回受講したか、などの事務的データのみしかありません）
<br>どのようなことに躓いているのか、どういった事はできているのかなどの情報は、
それを見るか、生徒自身が所持しているガイドブックを実際の授業中に確認しながら行うしかありません。
（生徒が授業を受ける時、学校保管用のファイルとガイドブック二つを持って授業に臨んでいます）
<br>実際指導員は、教習を行なった生徒に対し、その二つに生徒へのアドバイスや、次回担当する指導員へのメモも記載しています。

もし、指導員個人にタブレット端末などを配布し、使用できるようになったら
- ファイルを探しに行く手間も時間も削減できる。
- 自分の担当生徒が一目でわかる。
- 担当生徒に対しての他の指導員のコメントが確認できる。
- 担当外の生徒の授業を行なった際、コメントする形で担当指導員に情報を共有することができる。
- 授業前のインターバルの間に、自分が授業を行う生徒の情報の確認ができる。

という機能があればいいなと思い、今回のシステム作成のテーマに選ばせていただきました。

​
### ターゲットユーザ
<!--誰に使ってもらうかを具体的に記載する-->
- 生徒の情報共有に関してシステム導入を考えている自動車学校
- 指導員にタブレット端末を使用させ、情報管理をIT化させようと考えている自動車学校など
​
### 主な利用シーン
<!--どのような時に使うのかの状況を記載すること-->
- 指導員側・・・授業開始時に、担当する生徒に関する情報をチェックしたり、終了後には気になったことなどをコメントとして残しておくために利用する。
- 管理者側・・・新規生徒獲得の際、紙面だけでなくデータとして保存する。月末会議や年間の情報整理の時に、全体数や月データの参考資料として利用できる。
​
### 設計書
<!--テーマを設定・提出する時点では不要です-->
#### 実装機能リスト・テープル定義書・詳細設計
https://docs.google.com/spreadsheets/d/1-97nLuBwVKszEu-jq4DHByMKP-on7qrAyaeRjFuc1Hw/edit?usp=sharing
#### ER図
https://drive.google.com/file/d/1IU2jSQ-DEmYhQMCBVIOx-3nQh3ZjwQVW/view?usp=sharing

​
## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9
