---
title: "GNU make の環境変数"
emoji: "🐃"
type: "tech" # tech: 技術記事 / idea: アイデア
topics: ['make', 'makefile', 'gnumake', 'GNU']
published: false
---
- [`GNU make`](https://www.gnu.org/software/make/) では環境変数を扱える
  - おすすめの使い方がある
- `-e` オプションを使う方法がある
  - https://www.gnu.org/software/make/manual/html_node/Environment.html
- `export` を使って変数宣言する方法がある
  - https://www.gnu.org/software/make/manual/html_node/Variables_002fRecursion.html
- 書き方の具体的なおすすめとして `export AWS_PROFILE ?= default-profile` がある
- 12 Factor App の「設定：設定を環境変数に格納する」は試すとよさそう、という文脈もある
  - https://12factor.net/ja/
  - https://tanzu.vmware.com/content/blog/beyond-the-twelve-factor-app
- GitHub Actions などでも環境変数を上手に使うと簡素で、可読性が高く、変更容易性の高い記述ができるように思う
