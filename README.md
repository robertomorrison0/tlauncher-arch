# tlauncher-arch

> [!NOTE]
> I created this script in my spare time, and I am not affiliated with the company that created
> [TLauncher](https://tlauncher.org/en/). This script is provided "as is" without any warranties or guarantees. I am not responsible for any issues, damages, or losses that may arise from the use of this script. Use it at your own risk.

The C file ( [set_wm_class.c](https://gist.github.com/tgr/eae411cefde08cbed5c59d4f51ddb062) ) for changing the WM_CLASS comes from [Tisza Gergő](https://github.com/tgr). The creator is not involved in this project.

## Installation

```bash
$ git clone https://github.com/robertomorrison0/tlauncher-arch.git tlauncher
$ cd tlauncher
$ makepkg -si
```

## Updating

To update TLauncher repeat the install process as it will download the latest version automatically.
The Launcher itself does not have sufficiant perissions to update.
If you already have a folder with this repo and the build in it, you probably need to run `makepkg -sfi` to force the rebuild of the package.

