#!/bin/bash

# ファイル表示---------------------------------------
# 先頭25行の表示
cat sample.txt | head -n 25
# ログファイルの監視
tail -f /var/log/messages


# テキストファイル内の記述を重複を弾いて、ソート
cat sample.txt | sort | uniq -c | sort -nr

# 文字コード---------------------------------------
# カレントディレクトリ内の全ファイルの文字コードを一括でutf8に置換(上書き)
find . -type f -print0 | xargs -0 nkf --overwrite -w -Lu
# 文字コード&改行コードの判定
nkf --guess *.md

# 検索関連---------------------------------------
# grep で単語単位で検索する
dmesg | grep -w "video"
# 検索結果にヒットした行の前後の行も表示
cat sample.txt | grep -C 2 "video" # 前後2行も表示
cat sample.txt | grep -A 2 "video" # 後2行も表示
cat sample.txt | grep -B 2 "video" # 前2行も表示
# ○○を含まない行だけを表示する
ls -l /etc | grep -v "root"
ls -l /proc/ | grep -v -E "root\s+root" # 正規表現使用
# or検索
cat sample.txt | grep -E "文字列1|文字列2|文字列3"
# and検索
cat sample.txt | grep "文字列1" | grep "文字列2"

# sed---------------------------------------
# 指定業のみ出力
cat sample.txt | sed -n 2,4p # 2〜4行目のみ出力

# 行削除
cat sample.txt | sed 1d # 1行目の削除
cat sample.txt | sed 1,12d # 1～12行目を削除
# 文字列の挿入
cat sample.txt | sed "s/^/-- /" # すべての行頭に「-- 」を挿入
cat sample.txt | sed "s/\$/ --/" # すべての行末に「 --」を挿入

# 文字列置換
cat sample.txt | sed "s/sed/SED/g" # sed → SEDに置換
# 拡張子の置換
ls | sed "s/\.jpg$/.jpeg/" # $で末尾を指定

# スクリプトファイルの指定
# --- print.sed ---
# 2p
cat sample.txt | sed -f print.sed

# awk---------------------------------------
# 指定列のみ出力
ls -l | awk '{ print $6,$7,$8,$9 }'| column -t

# 圧縮/解凍---------------------------------------
# Windows環境で作成されたzipファイルを解凍(文字コードsjisを指定して解凍)
unzip -O sjis sample.zip
# カレントディレクトリのファイルをサブディレクトリ下のファイルも含めて「log20190303.zip」に圧縮する
zip -r log20190303 *

# アーカイブファイル「data0809.tgz」を作成する
tar -czvf data0809.tgz * # gzip形式で圧縮
# アーカイブファイル「data0809.tgz」を展開する
tar -xzvf data0809.tgz

# パッケージ関連---------------------------------------
# パッケージ管理にレポジトリを追加
sudo apt-add-repository ppa:fish-shell/release-3
# パッケージ管理からレポジトリを削除
sudo add-apt-repository --remove ppa:fish-shell/release-2

# システム関連---------------------------------------
# シャットダウン・再起動
sudo shutdown # 管理者権限必要
poweroff
reboot # rebootは内部でshutdown -r -q nowを呼び出しているだけ

notify-send 'テストメッセージ' # UbuntuのGnome通知にメッセージ送信

# プロセス関連---------------------------------------
# 実行中のプロセスを表示
ps axu
# 親子関係をツリー形式で表示
pstree -U
# ├─systemd─┬─(sd-pam)
# │         ├─at-spi-bus-laun─┬─dbus-daemon
# │         │                 └─3*[{at-spi-bus-laun}]
# │         ├─at-spi2-registr───2*[{at-spi2-registr}]
# │         ├─dbus-daemon
# │         ├─ibus-portal───2*[{ibus-portal}]
# │         └─pulseaudio───2*[{pulseaudio}]

# プロセス停止
kill <process number>

# パーミッション---------------------------------------
# 実行権限の付与
chmod +x sample.py
# 権限755［rwxr-xr-x］を付与
chmod 755 sample.py

# グループ/所有権---------------------------------------
# グループの変更
sudo chgrp web sample.sh # 「sample.sh」の所有グループを「web」に変更する
sudo chown .web sample.sh　# 「sample.sh」の所有グループを「web」に変更する
# 「sample.sh」の所有者を「api」というユーザーに変更する（所有グループは変更しない）
sudo chown api sample.sh
# 「sample.sh」の所有者を「api」に、所有グループを「web」に変更する
sudo chown web.api sample.sh

# リンク---------------------------------------
# シンボリックリンクを作成する
ln -s ./app/log/ log # ディレクトリのシンボリックリンクを作成する
ln -s ./bin/commandA commandA # ファイルのシンボリックリンクを作成する

# エイリアス---------------------------------------
# 現在設定されているエイリアスを確認する
alias

# CLI/GUIモード---------------------------------------
sudo systemctl isolate multi-user.target # CLIモードにする
sudo systemctl isolate graphical.target # GUIモードにする
sudo systemctl set-default multi-user.target # デフォルトをCLIモードにする
sudo systemctl set-default graphical.target # デフォルトをGUIモードにする

# シェル---------------------------------------
# デフォルトシェルをfishに変更
# https://github.com/fish-shell/fish-shell/
sudo chsh -s /usr/local/bin/fish

# シェルスクリプト関連---------------------------------------
# パスにスクリプト自身のパスを追加（%~dp0 で自身のパスを取得できる）
set "PATH=%~dp0;%PATH%"
