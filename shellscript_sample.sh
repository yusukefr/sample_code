#!/bin/bash

# システム関連---------------------------------------
# シャットダウン・再起動
sudo shutdown # 管理者権限必要
poweroff
reboot # rebootは内部でshutdown -r -q nowを呼び出しているだけ

# ファイル表示---------------------------------------
# 先頭25行の表示
cat sample.txt | head -n 25
# ログファイルの監視
tail -f /var/log/messages

# スクリプト自身のパスを取得---------------------------------------
# パスに自身のパスを追加（%~dp0 で自身のパスを取得できる）
set "PATH=%~dp0;%PATH%"

# 圧縮/解凍---------------------------------------
# Windows環境で作成されたzipファイルを解凍(文字コードsjisを指定して解凍)
unzip -O sjis sample.zip

# 文字コード---------------------------------------
# カレントディレクトリ内の全ファイルの文字コードを一括でutf8に置換(上書き)
find . -type f -print0 | xargs -0 nkf --overwrite -w -Lu
# 文字コード&改行コードの判定
nkf --guess *.md

# CLI/GUIモード---------------------------------------
sudo systemctl isolate multi-user.target # CLIモードにする
sudo systemctl isolate graphical.target # GUIモードにする
sudo systemctl set-default multi-user.target # デフォルトをCLIモードにする
sudo systemctl set-default graphical.target # デフォルトをGUIモードにする

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

# 検索関連---------------------------------------
# grep で単語単位で検索する
dmesg | grep -w video
# 検索結果にヒットした行の前後の行も表示
cat sample.txt | grep -C 2 video # 前後2行も表示
cat sample.txt | grep -A 2 video # 後2行も表示
cat sample.txt | grep -B 2 video # 前2行も表示
