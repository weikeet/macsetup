#!/bin/sh

source ~/.macsetup/base.sh

echo ""
print_cyan "Installing Homebrew cask recommended..."

# 查看应用详细信息可以使用命令 brew info cask_name/formula_name
# ```
# $ brew info slack
# slack: 4.27.154 (auto_updates)
# https://slack.com/
# /opt/homebrew/Caskroom/slack/4.22.0 (119B)
# From: https://github.com/Homebrew/homebrew-cask/blob/HEAD/Casks/slack.rb
# ==> Name
# Slack
# ==> Description
# Team communication and collaboration software
# ==> Artifacts
# Slack.app (App)
# ```

brew_install_cask_app "zeplin" "Zeplin.app"

# 开源 sqlite 数据库浏览器
brew_install_cask_app "db-browser-for-sqlite" "DB Browser for SQLite.app"

# 开源 mac 清理加速工具
brew_install_cask_app "tencent-lemon" "Tencent Lemon.app"

# 开源 Hosts 管理工具
brew_install_cask_app "switchhosts" "SwitchHosts.app"

# 开源 最强画图工具 流程图 UML...
brew_install_cask_app "drawio" "draw.io.app"

# 开源 Mac 菜单栏管理工具
brew_install_cask_app "hiddenbar" "Hidden Bar.app"

# 开源 Mac 强大的播放器
# brew_install_cask_app "iina" "IINA.app"

# 键盘按键的记录器
brew_install_cask_app "keycastr" "KeyCastr.app"

# 开源 下载器
brew_install_cask_app "motrix" "Motrix.app"

# 开源 文档编辑器
# brew_install_cask_app "obsidian" "Obsidian.app"

# 开源 状态栏工具切换
brew_install_cask_app "only-swich" "Only Switch.app"

# quick look plugins
# quicklook-csv quicklook-json webpquicklook
