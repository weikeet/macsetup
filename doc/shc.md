## shc

打包 shell 脚本成可执行文件。

### 简介

脚本的好处是便捷、高效，拿起来就可以写，写完就能跑，都不用编译。

但坏处也显而易见，一些敏感的、不想让外人知道的东西都是明文写在里面的，所以在这推荐一款神奇的脚本封装程序——shc。

### 安装

```bash
brew install shc
```

### 用法

```bash
shc -r -f /shellfile.sh
```

运行成功后会在当前目录下生成两个文件：

```
shellfile.sh.x
shellfile.sh.c
```

`shellfile.sh.x` 是脚本所对应的可执行程序

`shellfile.sh.c` 是 `shellfile.sh.x` 对应的 c 语言实现的源码

shc 根据脚本文件的第一行 `#!/bin/bash` 或其他 shell 将脚本翻译成相应的 c 源码并生成可执行程序 (shc 似乎无法识别 expect)

封装后的脚本安全性会有所提高，但这也仅能防个君子，通过 gdb 或其他调试工具仍然能获得最初的源码
