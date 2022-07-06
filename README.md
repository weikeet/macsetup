# macOS setup

macOS development environment auto setup.

## Requirements

- [Command Line Tools](https://developer.apple.com/download/more/)
- [Git](https://git-scm.com/)

安装好 [Command Line Tools](https://developer.apple.com/download/more/) 后，就可以使用 [Git](https://git-scm.com/) 命令了。

## 使用方法

### 自动执行

只需要执行以下代码即可：

```shell
curl https://raw.githubusercontent.com/lecymeng/mac-setup/master/setup.sh | sh && cd ~/.macsetup && zsh install.sh
```

### 手动执行

手动 clone 到 `~/.macsetup` 目录下，然后执行 `zsh install.sh` 即可。

```shell
git clone https://github.com/lecymeng/mac-setup.git ~/.macsetup

cd ~/.macsetup && zsh install.sh
```

## Q & A

### Zsh detects insecure completion-dependent directories

安装 oh-my-zsh 后显示 Zsh detects insecure completion-dependent directories ... 警告

解决方法：

```
bash ~/.macsetup/env/oh_my_zsh_fixed.sh
```

## links

- [命令行的艺术](https://github.com/jlevy/the-art-of-command-line/blob/master/README-zh.md)
- [bestswifter/macbootstrap](https://github.com/bestswifter/macbootstrap/)
- [nicolashery/mac-dev-setup](https://github.com/nicolashery/mac-dev-setup)
- [donnemartin/dev-setup](https://github.com/donnemartin/dev-setup)
- [bkuhlmann/mac_os-config](https://github.com/bkuhlmann/mac_os-config)
- [sourabhbajaj/mac-setup/](https://sourabhbajaj.com/mac-setup/)
- [Zsh 开发指南](https://zhuanlan.zhihu.com/p/28900182)
- [shell 数组、字典、source、split](https://blog.csdn.net/u014297722/article/details/54601660)
- [fixed declare: -A: invalid option](https://stackoverflow.com/questions/6047648/associative-arrays-error-declare-a-invalid-option)
