# SSH Manager

## 管理多个 git ssh

1. 使用 `ssh-keygen -t rsa -C "xxx" -f ~/.ssh/id_rsa.xxx` 生成 rsa IdentityFile
2. 使用 `cat id_rsa.xxx.pub` 查看公钥文件, 并复制添加到 git 服务中的 SSH keys
3. 使用 `ssh-add ~/.ssh/id_rsa.xxx` 添加私钥文件到缓存
4. 使用 `ssh -T git@gitxx.com` 测试是否可以成功连接

### GitHub

```shell
$ ssh-keygen -t rsa -C "github.weikeet" -f ~/.ssh/id_rsa.github.weikeet
Generating public/private rsa key pair.

$ cat id_rsa.github.weikeet.pub
# copy to GitHub -> settings -> SSH and GPG keys -> SSH keys

$ ssh-add ~/.ssh/id_rsa.github.weikeet
Enter passphrase for /Users/wei/.ssh/id_rsa.github.weikeet:
Identity added: /Users/wei/.ssh/id_rsa.github.weikeet (github.weikeet)

$ ssh -T git@github.com
Hi weikeet! You have successfully authenticated, but GitHub does not provide shell access.
```

### GitLab

```shell
$ ssh-keygen -t rsa -C "gitlab.weikeet" -f ~/.ssh/id_rsa.gitlab.weikeet
Generating public/private rsa key pair.

$ cat id_rsa.gitlab.weikeet.pub
# copy to GitLab -> profile -> SSH 密钥

$ ssh-add ~/.ssh/id_rsa.gitlab.weikeet
Enter passphrase for /Users/wei/.ssh/id_rsa.gitlab.weikeet:
Identity added: /Users/wei/.ssh/id_rsa.gitlab.weikeet (gitlab.weikeet)

$ ssh -T git@gitlab.com
Welcome to GitLab, @weikeet!
```

### Gitee

```shell
$ ssh-keygen -t rsa -C "gitee.weikeet" -f ~/.ssh/id_rsa.gitee.weikeet
Generating public/private rsa key pair.

$ cat id_rsa.gitee.weikeet.pub
# copy to Gitee -> profile -> SSH公钥

$ ssh-add ~/.ssh/id_rsa.gitee.weikeet
Enter passphrase for /Users/wei/.ssh/id_rsa.gitee.weikeet:
Identity added: /Users/wei/.ssh/id_rsa.gitee.weikeet (gitee.weikeet)

$ ssh -T git@gitee.com
Hi Weikeet! You have successfully authenticated, but GITEE.COM does not provide shell access.
```

## 管理多个 server ssh

### Unraid

```shell
$ ssh-keygen -t rsa -C "unraid.weiwei" -f ~/.ssh/id_rsa.unraid.weiwei
Generating public/private rsa key pair.

$ ssh-copy-id -i ~/.ssh/id_rsa.unraid.weiwei.pub root@192.168.2.233
...
Now try logging into the machine, with:   "ssh 'root@192.168.2.233'"
and check to make sure that only the key(s) you wanted were added.

$ ssh-add ~/.ssh/id_rsa.unraid.weiwei
Enter passphrase for /Users/wei/.ssh/id_rsa.unraid.weiwei:
Identity added: /Users/wei/.ssh/id_rsa.unraid.weiwei (unraid.weiwei)

$ ssh unraid.weiwei
Last login: Sun Oct  2 08:04:39 2022 from 192.168.2.157
Linux 5.19.9-Unraid.
```

test scp 传输文件

```shell
$ scp brew_list.txt unraid.weiwei:/mnt/user/weiwei
brew_list.txt                                 100%
```

### Unraid-frp

```shell
root@Weiwei:~# ls -l /mnt/user/weiwei/brew_list.txt
-rw-r--r-- 1 root root 2319 Oct  2 08:06 /mnt/user/weiwei/brew_list.txt
```

```shell
$ ssh-keygen -t rsa -C "unraid.weiwei.frp" -f ~/.ssh/id_rsa.unraid.weiwei.frp
Generating public/private rsa key pair.

$ ssh-copy-id -i ~/.ssh/id_rsa.unraid.weiwei.frp.pub -p 7001 root@81.70.11.147
...
Now try logging into the machine, with:   "ssh -p '7001' 'root@81.70.11.147'"
and check to make sure that only the key(s) you wanted were added.

$ ssh-add ~/.ssh/id_rsa.unraid.weiwei.frp
Enter passphrase for /Users/wei/.ssh/id_rsa.unraid.weiwei.frp:
Identity added: /Users/wei/.ssh/id_rsa.unraid.weiwei.frp (unraid.weiwei.frp)
```

### dsm

```shell
$ ssh-keygen -t rsa -C "dsm.weiwei" -f ~/.ssh/id_rsa.dsm.weiwei
Generating public/private rsa key pair.

$ ssh-copy-id -i ~/.ssh/id_rsa.dsm.weiwei.pub Weiwei@192.168.2.223
...
Received disconnect from 192.168.2.223 port 22:2: Too many authentication failures
Disconnected from 192.168.2.223 port 22

$ ssh-add --apple-use-keychain ~/.ssh/id_rsa.dsm.weiwei
Enter passphrase for /Users/weicools/.ssh/id_rsa.dsm.weiwei:
Identity added: /Users/weicools/.ssh/id_rsa.dsm.weiwei (dsm.weiwei)
```

### dsm-frp

```shell
$ ssh-keygen -t rsa -C "dsm.weiwei.frp" -f ~/.ssh/id_rsa.dsm.weiwei.frp
Generating public/private rsa key pair.

$ ssh-copy-id -i ~/.ssh/id_rsa.dsm.weiwei.frp.pub -p 7003 Weiwei@81.70.11.147
...
Received disconnect from 81.70.11.147 port 7003:2: Too many authentication failures
Disconnected from 81.70.11.147 port 7003

$ ssh-add --apple-use-keychain ~/.ssh/id_rsa.dsm.weiwei.frp
Enter passphrase for /Users/weicools/.ssh/id_rsa.dsm.weiwei.frp:
Identity added: /Users/weicools/.ssh/id_rsa.dsm.weiwei.frp (dsm.weiwei.frp)
```

### vm-centos

```shell
$ ssh-keygen -t rsa -C "vm.centos" -f ~/.ssh/id_rsa.vm.centos
Generating public/private rsa key pair.

$ ssh-copy-id -i ~/.ssh/id_rsa.vm.centos.pub root@192.168.2.217
...
Now try logging into the machine, with:   "ssh 'root@192.168.2.217'"
and check to make sure that only the key(s) you wanted were added.

$ ssh-add --apple-use-keychain ~/.ssh/id_rsa.vm.centos
Enter passphrase for /Users/weicools/.ssh/id_rsa.vm.centos:
Identity added: /Users/weicools/.ssh/id_rsa.vm.centos (vm.centos)
```

### vm-centos-frp

```shell
$ ssh-keygen -t rsa -C "vm.centos.frp" -f ~/.ssh/id_rsa.vm.centos.frp
Generating public/private rsa key pair.

$ ssh-copy-id -i ~/.ssh/id_rsa.vm.centos.frp.pub -p 7000 root@81.70.11.147
...
Now try logging into the machine, with:   "ssh -p '7000' 'root@81.70.11.147'"
and check to make sure that only the key(s) you wanted were added.

$ ssh-add --apple-use-keychain ~/.ssh/id_rsa.vm.centos.frp
Enter passphrase for /Users/weicools/.ssh/id_rsa.vm.centos.frp:
Identity added: /Users/weicools/.ssh/id_rsa.vm.centos.frp (vm.centos.frp)
```

### server-tencent

```shell
$ ssh-keygen -t rsa -C "server.tencent" -f ~/.ssh/id_rsa.server.tencent                                          <<<
Generating public/private rsa key pair.

$ ssh-copy-id -i ~/.ssh/id_rsa.server.tencent.pub root@81.70.11.147
...
Received disconnect from 81.70.11.147 port 22:2: Too many authentication failures
Disconnected from 81.70.11.147 port 22

$ ssh-add --apple-use-keychain ~/.ssh/id_rsa.server.tencent
Enter passphrase for /Users/weicools/.ssh/id_rsa.server.tencent:
Identity added: /Users/weicools/.ssh/id_rsa.server.tencent (server.tencent)
```
