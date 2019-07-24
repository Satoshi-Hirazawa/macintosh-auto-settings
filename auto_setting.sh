## Macの初期設定を自動化するスクリプト ##

### キー入力があるまで待つ

    read -p "Hit enter: "

### システム設定を閉じる

    echo "close SystemPreferences"
    killall System\ Preferences

### 隠しファイルを表示する

    echo "show HiddenFiles"
    defaults write com.apple.finder AppleShowAllFiles -boolean true

### メニューバーを自動的に隠す

    echo "hide MenuBar"
    defaults write -globalDomain _HIHideMenuBar -bool true

### Finder再起動

    killall Finder

### Dockを自動的に隠す

    echo "hide Dock"
    defaults write com.apple.dock autohide -bool true

### Dock に標準で入っている全てのアプリを消す

    echo "erase Dock's App"
	defaults write com.apple.dock persistent-apps -array

### Dock再起動

    echo "reboot Dock"
    killall Dock

### スクリーンセーバーを開始しない

    echo "do not start the screen saver"
    defaults -currentHost write com.apple.screensaver idleTime -int 0

# 壁紙変更

    echo "change the wallpaper to Solid Gray Dark.png"
    osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Library/Desktop Pictures/Solid Colors/Solid Gray Dark.png"'

### ウィンドウ復元無効化

    echo "window restoration disabled"
    defaults write -g ApplePersistenceIgnoreState YES

### スリープ無効

    echo "sleep disabled"
    sudo pmset -a displaysleep 0
    sudo pmset -a disksleep 0
    sudo pmset -a sleep 0

### 自動起動（スクリプトからだと、起動・終了どちらか一つしか設定できなかった）

#    echo "set poweron time"
#    sudo pmset repeat poweron MTWRFSU 10:00:00

### 自動終了（スクリプトからだと、起動・終了どちらか一つしか設定できなかった）

    echo "set shutdown time"
    sudo pmset repeat shutdown MTWRFSU 20:00:00

### 日ごとにスケジュールを設定したい場合（こちらは複数設定可能）
#    sudo pmset schedule wake "12/30/17 12:00:00"
#    sudo pmset schedule wake "12/31/17 12:00:00"

### 起動時間・終了時間の確認

    echo "get poweron & shutdown time"
    sudo pmset -g sched

### homebrewのインストール

    echo "install homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

	sudo chown -R $(whoami) /usr/local/var/homebrew

### wgetのインストール

    echo "install wget"
    brew install wget

### zshのインストール

    echo "install zsh"
    brew install zsh


### システム終了ウィンドウを表示してシステムの正常終了をする 
###	osascript -e 'tell app "loginwindow" to «event aevtrsdn»'

### 通知センターを停止
###    launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist

### おまけ
###     telnet towel.blinkenlights.nl
