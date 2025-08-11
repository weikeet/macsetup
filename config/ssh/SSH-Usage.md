# SSH Usage

## ssh-keygen 生成密钥

params:

- -b 指定密钥长度
- -e 读取已有私钥或者公钥文件
- -t 指定要创建的密钥类型 (eg: rsa)
- -f 指定用来保存密钥的文件名
- -C 添加注释

sample:

```shell
$ ssh-keygen -t rsa -b 4096 -C "xxx" -f ~/.ssh/id_rsa.xxx
Generating public/private rsa key pair.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /Users/wei/.ssh/id_rsa.xxx.
Your public key has been saved in /Users/wei/.ssh/id_rsa.xxx.pub.
The key fingerprint is:
SHA256:WRZktNSVoY+a5hAgNwou
```

reset password:

```shell
$ ssh-keygen -p -f ~/.ssh/id_rsa.xxx
Enter old passphrase: 
Enter new passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved with the new passphrase.

# or
$ ssh-keygen -p -P abcd -N 1234 -f ~/.ssh/id_rsa.xxx
Your identification has been saved with the new passphrase.
```

## ssh-copy-id 复制公钥到远程服务器

创建密钥后，需要添加公钥内容追加到远程服务器的 `authorized_keys` 文件

添加到远程服务器有两种方式：

- 使用命令 ssh-copy-id (一般适用于 服务器)
- 手动复制公钥到远程 (一般适用于 git)

命令 `ssh-copy-id` 使用本地公钥认证远程服务器

```shell
ssh-copy-id -i IdentityFile.pub -p Port user@hostname
```

```shell
$ ssh-copy-id -i ~/.ssh/id_rsa.xxx.pub -p 22 root@192.168.2.233
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/Users/wei/.ssh/id_rsa.xxx.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
Received disconnect from 192.168.2.123 port 22:2: Too many authentication failures
Connection to 192.168.2.123 closed by remote host.
```

手动复制: 服务器执行命令 >> 追加到文件末尾

```shell
# 需要先传 id_rsa.xxx.pub 到服务器
cat id_rsa.xxx.pub >> authorized_keys
```

Git 则是复制 id_rsa.xxx.pub 内容到 SSH keys 设置。

## ssh-add 添加私钥缓存

公钥添加到服务器后，需要把私钥添加到换行，否则会出现 `Permission denied (publickey).`

添加私钥缓存方法：

```shell
ssh-add [IdentityFile]
```

sample:

```shell
ssh-add ~/.ssh/id_rsa.xxx

# 查询缓存私钥
$ ssh-add -l
3072 SHA256:hKoLD3jcYGH0w4CBCQXvn7qNBk3Pi+FmNDkOOLqHzUA xxx (RSA)

# 删除缓存私钥
$ ssh-add -D
All identities removed.
```

### 解决 ssh-add 重启缓存失效

执行 `ssh-add privateKey` 将 SSH 的私钥添加进去，但是发现了一个问题就是每次重启电脑后都需要重新 ssh-add，这个命令不是用来永久性的记住你所使用的私钥的。实际上，它的作用只是把你指定的私钥添加到 `ssh-agent` 所管理的一个 `session` 当中。而 `ssh-agent` 是一个用于存储私钥的临时性的 session 服务，也就是说当你重启之后，`ssh-agent` 服务也就重置了，`session` 会话也就失效了。

显然每次重启后都需要重新添加很麻烦，既然 `ssh-agent` 是个临时的，那么对于 Mac 来说，哪里可以永久存储的，显然就是 `Keychain` 了，在执行 `ssh-add -K privateKey` 后可以打开偏好设置中的 `Keychain` 就可以看到新增的 SSH 条目了。

```shell
# 执行一遍带 -K 参数的命令，把私钥放到 mac 的 Keychain
$ ssh-add -K ~/.ssh/id_rsa.xxx
WARNING: The -K and -A flags are deprecated and have been replaced
         by the --apple-use-keychain and --apple-load-keychain
         flags, respectively.  To suppress this warning, set the
         environment variable APPLE_SSH_ADD_BEHAVIOR as described in
         the ssh-add(1) manual page.
Identity added: /Users/wei/.ssh/id_rsa.xxx (xxx)

# 后续执行 ssh-add -K ~/.ssh/id_rsa.xxx 就不再需要输入密码了
```

使用 -K 执行虽然可以但是新的 mac 系统有警告，建议使用 `--apple-use-keychain` 和 `--apple-load-keychain`

```shell
$ ssh-add --apple-use-keychain ~/.ssh/id_rsa.xxx
Enter passphrase for /Users/wei/.ssh/id_rsa.xxx:
Identity added: /Users/wei/.ssh/id_rsa.xxx (xxx)
```

后续自动执行 ssh-add 方法

方法1: 使用 startup 文件

例如：在终端输入 `vim ~/.zshrc`，然后在里面添加 `ssh-add --apple-use-keychain ~/.ssh/id_rsa.xxx`

保存后执行 `source ~/.zshrc` 或打开新的终端窗口，可以看到 添加成功的信息，每次打开窗口都会自动 add 一下更别说重启啦。最后有强迫症的我，自然是希望无感的，不希望他每次都提示我添加成功。那么我们把换成在这个 `nohup ssh-add --apple-use-keychain ~/.ssh/id_rsa.xxx >/dev/null 2>&1`。就是前后加一下 `nohup` 和 `>/dev/null 2>&1`。作用是把输出的日志丢到 `黑洞` 里面

方法2: 开机自动执行

因为这个私钥在高速缓存中只是重启以后才失效，我们每次打开窗口都重新加载一下，比较冗余并且大家可以看到我打开一个新终端稍微会慢一点，牺牲了一点性能，就为了重启的一次丢失导致每次打开终端都需要add，这不是一个很好地设计。最小性能牺牲应该是开机执行一遍，`centos` 有用 `/etc/rc.d/rc.local`，mac 下没有对应的文件，但是有 `自动操作` 可以设置自动执行 shell 脚本。

打开自动操作，选择应用程序，然后输入 shell，并且选择 shell

![QLNdiT](https://blog-1251678165.cos.ap-chengdu.myqcloud.com/uPic/QLNdiT.png)

![ztqdA2](https://blog-1251678165.cos.ap-chengdu.myqcloud.com/uPic/ztqdA2.png)

记得使用 `--apple-use-keychain` 替换 `-K` , 懒得再截图了。

然后系统偏好设置-用户与群组-登陆项 添加

![uhytjf](https://blog-1251678165.cos.ap-chengdu.myqcloud.com/uPic/uhytjf.png)

## ssh-agent 代理设置

生成新的 ssh 密钥之后，可以添加私钥到 ssh-agent，这样之后拉取新的仓库或测试时就不再需要输入密码了。

```shell
# 启动 ssh-agent
$ eval "$(ssh-agent -s)"
Agent pid 7804

# 添加 ssh 私钥
$ ssh-add ~/.ssh/id_rsa.xxx
Enter passphrase for /Users/wei/.ssh/id_rsa.xxx: 
Identity added: /Users/wei/.ssh/id_rsa.xxx (/Users/wei/.ssh/id_rsa.xxx)
```

## ssh-config

ssh程序可以从以下途径获取配置参数：

- 命令行选项
- 用户配置文件 (~/.ssh/config) 通常不存在，如果需要自己新建
- 系统配置文件 (/etc/ssh/ssh_config)

优先级-参数数据解析顺序如下：

- 命令行选项
- 用户配置文件
- 系统配置文件

所有的配置选项仅第一次设置有效，所以可以将默认值放置在系统配置文件，修改参数放置在用户配置文件

params:

- Host 别名
- HostName 主机名 (IP/域名)
- Port 端口, 默认为 22
- User 用户名
- ForwardAgent 允许 ssh-agent 转发 [yes|no]
- IdentityFile 密钥文件路径
- IdentitiesOnly 指定 ssh 是否仅使用配置文件或命令行指定的私钥文件进行认证 [yes|no]
- PreferredAuthentications 强制使用 x 验证 [publickey|password|keyboard-interactive]

通过 Host 指定配置块，用 tab 键来区分配置头和内置参数

template

```shell
Host sample
    HostName 192.168.2.123
    Port 22
    User root
    IdentityFile ~/.ssh/sample
    PreferredAuthentications publickey
```

## Best-practice

### 管理多个 git ssh

1. 使用 `ssh-keygen -t rsa -C "xxx" -f ~/.ssh/id_rsa.xxx` 生成 rsa IdentityFile
2. 使用 `cat id_rsa.xxx.pub` 查看公钥文件, 并复制添加到 git 服务中的 SSH keys
3. 使用 `ssh-add ~/.ssh/id_rsa.xxx` 添加私钥文件到缓存
4. 使用 `ssh -T git@gitxx.com` 测试是否可以成功连接

> 可以使用 ssh-add --apple-use-keychain ~/.ssh/id_rsa.xxx 配合自动操作免去每次重启都需要执行 ssh-add

### 管理 ssh session

通常利用 ssh 连接远程服务器，一般都要输入以下类似命令：

```shell
ssh -p port user@hostname
ssh -i IdentityFile -p port user@hostname
```

sample:

```shell
ssh -p 22 root@ssh.test.com

ssh -i ~/.ssh/id_rsa_test -p 22 root@ssh.test.com
```

如果拥有多个 ssh 账号，需要终端里直接 ssh 登陆，又不用 PuTTY、SecureCRT 之类的 ssh 客户端的，要记住每个ssh 账号的参数，比较浪费精力和时间。

ssh 提供一种优雅且灵活的方式来解决这个问题，就是利用 ssh 的用户配置文件 config 管理 ssh 会话。ssh 的用户配置文件是放在当前用户根目录下的 .ssh 文件夹里（ ~/.ssh/config, 不存在则新创建一个），其配置写法如下：

使用配置文件方式：

```shell
$ vim ~/.ssh/config
Host sshtest
    HostName ssh.test.com
    User root
    Port 22
    IdentityFile ~/.ssh/id_rsa_test
```

配置好之后就可以这样用 ssh 登陆服务器了：

```shell
ssh sshtest

# 传输文件
$ scp hello.txt sshtest:/home/
```

## References

- [利用 ssh 的用户配置文件 config 管理 ssh 会话](https://luohoufu.github.io/2016/07/21/deepin2/)
- [ssh-add重启后失效解决方法](https://www.someget.cn/linux/2021/10/12/linux_ssh04.html)
- [ssh docs](https://github.com/ZJDoc/Deploy/tree/master/docs/ssh)
