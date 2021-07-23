#  hunch.


## UI

- home
  - [x] 店舗リスト
  - [ ] 店舗詳細 ing
    - 特にこれ　→　switchの実現
  - [ ] 店舗編集
- map
  - [x] mapview
  - [ ] 店舗カード
- setting
  - [x] setting list
  - [x] version page
  - [ ] login

## Logic

- ログイン状態の管理　ライブラリありそう
- Notification
- DB
  - firebase
  - **cloud storage** FOR image *

## メモ

- 近くの店舗はpriority_queueで
- 画像のサイズ次第serializeして直接firebaseに入れるのもありかな
- Tamil MN はiOSではシステムフォントに入ってない（macOSにはあるけど）、一応インストールした
- 店の名前はめっちゃ長かったら超えた部分を非表示にする？ -> Dont' change cards' size.


## TODO

週~20h

### 7/20 - 7/26
- [ ] 残りのUI
- [ ] DB + model
- [ ] viewmodel

### 7/27 - 8/2
- viewmodel
- notification
