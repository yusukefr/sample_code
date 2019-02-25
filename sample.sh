#!/bin/bash

# システム関連---------------------------------------
# シャットダウン・再起動
sudo shutdown # 管理者権限必要
poweroff
reboot


# ファイル表示---------------------------------------
# 先頭25行の表示
cat sample.txt | head -n 25
# ログファイルの監視
tail -f /var/log/messages
