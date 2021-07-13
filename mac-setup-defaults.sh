#!/bin/bash

if [ "$(uname)" != "Darwin" ] ; then
  echo 'Not macOS!'
  exit 1
fi

echo 'Setup MacOS'

###################################################################
# Hidden                                                          #
###################################################################

# ~/Library ディレクトリを見えるようにする
chflags nohidden ~/Library

# /Volumes ディレクトリを見えるようにす
sudo chflags nohidden /Volumes

###################################################################
# Sound                                                           #
###################################################################

# ブート時のサウンドを無効化する
sudo nvram SystemAudioVolume=" "

# Bluetooth ヘッドフォン・ヘッドセットの音質を向上させる
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

###################################################################
# KeyRepeat                                                       #
###################################################################

# キーリピートの速度
defaults write NSGlobalDomain KeyRepeat -int 2

# キーリピート開始までのタイミング
defaults write NSGlobalDomain InitialKeyRepeat -int 15

###################################################################
# Finder                                                          #
###################################################################

# Finder のタイトルバーにフルパスを表示する
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# 名前で並べ替えを選択時にディレクトリを前に置くようにする
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# フォルダを開くときのアニメーションを無効にする
defaults write com.apple.finder AnimateWindowZoom -bool false

# 不可視ファイルを表示する
defaults write com.apple.finder AppleShowAllFiles YES

# 検索時にデフォルトでカレントディレクトリを検索する
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# 拡張子変更時の警告を無効化する
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# クイックルックでテキストを選択可能にする
defaults write com.apple.finder QLEnableTextSelection -bool true

# Finder を終了させる項目を追加する
defaults write com.apple.Finder QuitMenuItem -bool true

# パスバーを表示する
defaults write com.apple.finder ShowPathbar -bool true

# ステータスバーを表示する
defaults write com.apple.finder ShowStatusBar -bool true

# タブバーを表示する
defaults write com.apple.finder ShowTabView -bool true

# ゴミ箱を空にする前の警告を無効化する
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# 未確認のアプリケーションを実行する際のダイアログを無効にする
defaults write com.apple.LaunchServices LSQuarantine -bool false

# ファイル共有を有効にした時、共有先に自分の Mac を表示させる
defaults write com.apple.NetworkBrowser ShowThisComputer -bool true

###################################################################
# Safari                                                          #
###################################################################

# Safari のコンテキストメニューに Web インスペクタを追加する
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# ファイルのダウンロード後に自動でファイルを開くのを無効化する
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Safari の開発・デバッグメニューを有効にする
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# アドレスバーに完全な URL を表示する
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# ステータスバーを表示する
defaults write com.apple.Safari ShowStatusBar -bool true

# 検索クエリを Apple へ送信しない
defaults write com.apple.Safari SuppressSearchSuggestions -bool true
defaults write com.apple.Safari UniversalSearchEnabled -bool false

# Safari の開発・デバッグメニューを有効にする
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true

###################################################################
# ScreenCapture                                                   #
###################################################################

# スクリーンキャプチャの影をなくす
defaults write com.apple.screencapture disable-shadow -bool true

# スクリーンショットの保存形式を PNG にする
defaults write com.apple.screencapture type -string "png"

###################################################################
# Others                                                          #
###################################################################

# UTF-8 のみを使用する
defaults write com.apple.terminal StringEncodings -array 4

# コンソールアプリケーションの画面サイズ変更を高速にする
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# クラッシュレポートを無効化する
defaults write com.apple.CrashReporter DialogType -string "none"

# USB やネットワークストレージに .DS_Store ファイルを作成しない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Dock が表示されるまでの待ち時間を無効にする
defaults write com.apple.dock autohide-delay -float 0

# 時計アイコンクリック時に OS やホスト名 IP を表示する
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# ファイルを開くときのアニメーションを無効にする
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

# ツールチップ表示までのタイムラグをなくす
defaults write -g NSInitialToolTipDelay -integer 0

# ダイアログ表示やウィンドウリサイズ速度を高速化する
defaults write -g NSWindowResizeTime 0.1

# 全ての拡張子のファイルを表示する
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# スクロールバーを常時表示する
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

echo 'End Setup MacOS'
