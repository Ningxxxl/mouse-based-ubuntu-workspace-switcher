# mouse-based-ubuntu-workspace-switcher

Switch Ubuntu workspace via extra mouse buttons.

一种使用鼠标侧键切换Ubuntu工作区的方法。

## Introduction

1. 可以通过鼠标侧键（可替换成其他按键）切换Ubuntu工作区。
2. 限制工作区范围为 第一个 至 倒数第二个 工作区。 <br/>
（默认的最后一个工作区为空白，一旦切换到最后一个工作区，则难以切换回之前的工作区）
3. 实现思路：
   1. 编写脚本，使用 `xdotool` 实现工作区切换。
   2. 通过 `xbindkeys` 实现鼠标侧键的监听，触发脚本，

## Environment

* Ubuntu 24.04 LTS x86_64
* GNOME 46.0
* xbindkeys 1.8.7
* xdotool 3.20160805.1

## Tutorial

### Step 1: Create scripts

* Copy [`.to_next_desktop.sh`](src/.to_next_desktop.sh) to `/path/to/to_next_desktop.sh`.
* Copy [`.to_prev_desktop.sh`](src/.to_prev_desktop.sh) to `/path/to/to_prev_desktop.sh`.

### Step 2: Install dependencies

```shell
sudo apt install xbindkeys xautomation xdotool
```

### Step 3: Configure xbindkeys

1. Use XEV to find the keycode of the mouse button:
   ```shell
   xev | grep button
   ```

2. Generate xbindkeys configuration file:

   ```shell
   xbindkeys --defaults > $HOME/.xbindkeysrc
   ```

3. Edit `$HOME/.xbindkeysrc`:

   Add Keybinding: (My extra mouse buttons are `b:8` and `b:9`)
   ```text
   "/bin/bash /path/to/.to_next_desktop.sh"
     b:8
    
   "/bin/bash /path/to/.to_prev_desktop.sh"
     b:9
   ```

4. Restart xbindkeys:

   ```shell
   killall xbindkeys
   xbindkeys -f $HOME/.xbindkeysrc
   ```
   
